function Get-LansweeperReport {
    [CmdletBinding()]
    param(
        [string] $SqlInstance,
        [string] $Database = 'lansweeperdb'
    )
    DynamicParam {
        $ParameterSetsAttributes = New-Object System.Management.Automation.ParameterAttribute
        $ParameterSetsAttributes.Mandatory = $true
        $ParameterSetsAttributes.ParameterSetName = 'Manual'

        # Definitions for Report
        $Names = (Get-ReportFiles -Path "$PSScriptRoot\..\Resources\Reports").Keys
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
        $Reports = $PSBoundParameters.Report

        $AvailableReports = Get-ReportFiles -Path "$PSScriptRoot\..\Resources\Reports"
        foreach ($Report in $Reports) {
            [System.Collections.IDictionary] $CurrentReport = $AvailableReports[$Report]
            Invoke-DbaQuery -File $CurrentReport.FullPath `
                -SqlInstance $SqlInstance -Database $Database
        }
    }
}