<p align="center">
  <a href="https://www.powershellgallery.com/packages/PSLansweeper"><img src="https://img.shields.io/powershellgallery/v/PSLansweeper.svg"></a>
  <a href="https://www.powershellgallery.com/packages/PSLansweeper"><img src="https://img.shields.io/powershellgallery/vpre/PSLansweeper.svg?label=powershell%20gallery%20preview&colorB=yellow"></a>
  <a href="https://github.com/EvotecIT/PSLansweeper"><img src="https://img.shields.io/github/license/EvotecIT/PSLansweeper.svg"></a>
</p>

<p align="center">
  <a href="https://www.powershellgallery.com/packages/PSLansweeper"><img src="https://img.shields.io/powershellgallery/p/PSLansweeper.svg"></a>
  <a href="https://github.com/EvotecIT/PSLansweeper"><img src="https://img.shields.io/github/languages/top/evotecit/PSLansweeper.svg"></a>
  <a href="https://github.com/EvotecIT/PSLansweeper"><img src="https://img.shields.io/github/languages/code-size/evotecit/PSLansweeper.svg"></a>
  <a href="https://github.com/EvotecIT/PSLansweeper"><img src="https://img.shields.io/powershellgallery/dt/PSLansweeper.svg"></a>
</p>

<p align="center">
  <a href="https://twitter.com/PrzemyslawKlys"><img src="https://img.shields.io/twitter/follow/PrzemyslawKlys.svg?label=Twitter%20%40PrzemyslawKlys&style=social"></a>
  <a href="https://evotec.xyz/hub"><img src="https://img.shields.io/badge/Blog-evotec.xyz-2A6496.svg"></a>
  <a href="https://www.linkedin.com/in/pklys"><img src="https://img.shields.io/badge/LinkedIn-pklys-0077B5.svg?logo=LinkedIn"></a>
</p>

# PSLansweeper - PowerShell Module
`PSLansweeper` is small module (about 80 lines of code) that interacts with Lansweeper SQL Database. It does need direct access to SQL.

## Changelog

- 0.0.1 - 2019.07.13
  - First Release (draft)
- 0.0.2 - 2019.07.14
  - First Public release

## Usage

```PowerShell
Import-Module PSLansweeper

$Test = Get-LansweeperReport -SqlInstance "LANSWEEPER.AD.EVOTEC.XYZ" -Report WindowsAutomaticUpdateSettingsAudit
$Test | Format-Table *

$Test = Get-LansweeperReport -SqlInstance "LANSWEEPER.AD.EVOTEC.XYZ" -Report WindowsAutomaticUpdateSettingsAudit,MicrosoftPatchTuesdayAuditJuly2019
$Test.WindowsAutomaticUpdateSettingsAudit | Format-Table -AutoSize
$Test.MicrosoftPatchTuesdayAuditJuly2019 | Format-Table -AutoSize

```

### Example 1

```PowerShell
Get-LansweeperReport -SqlInstance "LANSWEEPER.AD.EVOTEC.XYZ" -Report SoftwareLicenseKeyOverview | Format-Table -Autosize
Get-LansweeperReport -SqlInstance "LANSWEEPER.AD.EVOTEC.XYZ" -Report InstalledWindowsUpdates | Format-Table -Autosize
```

![Image](https://evotec.xyz/wp-content/uploads/2019/07/img_5d2a375537ae3.png)

### Example 2

```PowerShell
Get-LansweeperReport -SqlInstance "LANSWEEPER.AD.EVOTEC.XYZ" -Report AdobeJulySecurityUpdateVulernabilityAudit
```

![Image](https://evotec.xyz/wp-content/uploads/2019/07/img_5d2a37beab380.png)

### Example 3

```PowerShell
Get-LansweeperReport -SqlInstance "LANSWEEPER.AD.EVOTEC.XYZ" -Report ComputerProcessorInformation,AllServerTypes
```

![Image](https://evotec.xyz/wp-content/uploads/2019/07/img_5d2af27f37b6a.png)


### To install

Following way uses PowerShellGallery to install module. When I publish modules to PSGallery those modules are optimized for speed (minified)

```powershell
Install-Module -Name PSLansweeper -AllowClobber -Force
```

Force and AllowClobber aren't really nessecary but they do skip errors in case some appear (like conflict with other modules).

### And to update

```powershell
Update-Module -Name PSLansweeper
```

That's it. Whenever there's new version you simply run the command and you can enjoy it. Remember, that you may need to close, reopen PowerShell session if you have already used module before updating it.

**The important thing** is if something works for you on production, keep using it till you test the new version on a test computer. I do changes that may not be big, but big enough that auto-update will break your code. For example, small rename to a parameter and your code stops working! Be responsible!

### Credits

- Marcus Dean created [LansweeperPS](https://github.com/marcus-dean/Lansweeper-PS) PowerShell module which does similar thing. He's also inspiration for this little project as per this [Reddit thread](https://www.reddit.com/r/Lansweeper/comments/cc54wq/lansweeperps_modules/).

### 3rd Party Notices

- [x] All SQL code available in Reports folder is copied from [Lansweeper Report](https://www.lansweeper.com/report/) or Lansweeper Community Forum. This means that all SQL content is work of someone else. They made those reports. I just made them easily available in this PowerShell Module.