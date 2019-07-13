Import-Module .\PSLansweeper.psd1 -Force

$Test = Get-LansweeperReport -SqlInstance "LANSWEEPER.AD.EVOTEC.XYZ" -Report WindowsAutomaticUpdateSettingsAudit
$Test | Format-Table *

$Test = Get-LansweeperReport -SqlInstance "LANSWEEPER.AD.EVOTEC.XYZ" -Report WindowsAutomaticUpdateSettingsAudit,MicrosoftPatchTuesdayAuditJuly2019
$Test.WindowsAutomaticUpdateSettingsAudit | Format-Table -AutoSize
$Test.MicrosoftPatchTuesdayAuditJuly2019 | Format-Table -AutoSize