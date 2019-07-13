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
`PSLansweeper` is small module that interacts with Lansweeper SQL Database. It does need direct access to SQL.

### To install

```powershell
Install-Module -Name PSLansweeper -AllowClobber -Force
```

Force and AllowClobber aren't really nessecary but they do skip errors in case some appear.

### And to update

```powershell
Update-Module -Name PSLansweeper
```

That's it. Whenever there's new version you simply run the command and you can enjoy it. Remember, that you may need to close, reopen PowerShell session if you have already used module before updating it.

**The important thing** is if something works for you on production, keep using it till you test the new version on a test computer. I do changes that may not be big, but big enough that auto-update will break your code. For example, small rename to a parameter and your code stops working! Be responsible!