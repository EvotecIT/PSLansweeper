Import-Module .\PSLansweeper.psd1 -Force

Get-LansweeperReport -SqlInstance "LANSWEEPER.AD.EVOTEC.XYZ" -Report AdobeJulySecurityUpdateVulnerabilityAudit  | Format-Table