function Get-LansweeperReport {
    [CmdletBinding()]
    param(
        [string] $SqlInstance,
        [string] $Database = 'lansweeperdb',
        [parameter(ParameterSetName = "ListReports")][switch] $ListReports
    )
    DynamicParam {
        $ParameterSetsAttributes = New-Object System.Management.Automation.ParameterAttribute
        $ParameterSetsAttributes.Mandatory = $true
        $ParameterSetsAttributes.ParameterSetName = 'Manual'

        # Definitions for Report
        [string] $AllUserReportsPath = "$Env:ALLUSERSPROFILE\Evotec\PSLansweeper"
        [string] $CurrentUserReportsPath = "$Env:USERPROFILE\Evotec\PSLansweeper"

        $AvailableReports = Get-ReportFiles -Path "$PSScriptRoot\..\Resources\Reports", $AllUserReportsPath, $CurrentUserReportsPath
        $Names = ($AvailableReports).Keys
        $ReportAttrib = New-Object  System.Collections.ObjectModel.Collection[System.Attribute]
        $ReportAttrib.Add($ParameterSetsAttributes)
        $ReportAttrib.Add($ParamAttribDatesRange)
        $ReportAttrib.Add($ParameterSetsAttributesDateManual)
        $ReportAttrib.Add((New-Object System.Management.Automation.ValidateSetAttribute($Names)))
        $ReportRuntimeParam = New-Object System.Management.Automation.RuntimeDefinedParameter('Report', [string[]], $ReportAttrib)

        # Finalization
        $RuntimeParamDic = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
        $RuntimeParamDic.Add('Report', $ReportRuntimeParam)
        return $RuntimeParamDic
    }
    Process {
        if ($ListReports) {
            return $AvailableReports.Keys
        }

        [Array] $Reports = $PSBoundParameters.Report

        $Output = [ordered] @{ }
        foreach ($Report in $Reports) {
            [System.Collections.IDictionary] $CurrentReport = $AvailableReports[$Report]
            try {
                $Output[$Report] = Invoke-DbaQuery -File $CurrentReport.FullPath -SqlInstance $SqlInstance -Database $Database -ErrorAction Stop | Select-Object -Property * -ExcludeProperty Table, ItemArray, HasErrors, RowError, RowState
            } catch {
                $ErrorMessage = $_.Exception.Message -replace "`n", " " -replace "`r", " "
                Write-Warning "Get-LansweeperReport - Error message: $ErrorMessage"
            }
        }
        if ($Reports.Count -eq 1) {
            $Output[$Reports[0]]
        } else {
            $Output
        }
    }
}