function Get-ReportFiles {
    [CmdletBinding()]
    param(
        [string[]] $Path
    )
    $Files = foreach ($_ in $Path) {
        if (Test-Path -LiteralPath $_) {
            Get-ChildItem -LiteralPath $_ -Filter '*.sql' -Recurse
        }
    }
    $Reports = [ordered] @{ }
    foreach ($_ in $Files ) {
        $Name = $_.Name.Replace(' ', '').Replace('.sql', '').Replace('-', '').Replace('–', '')
        $Reports[$Name] = [ordered] @{
            Name        = $Name
            DisplayName = ($_.Name).Replace('.sql', '').Replace('-', '')
            FullPath    = $_.FullName
        }
    }
    $Reports
}