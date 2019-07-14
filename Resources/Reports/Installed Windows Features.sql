Select
  Distinct Top 1000000
  tblAssets.AssetID,
  tblAssets.AssetName,
  tblAssets.Domain,
  tblAssets.Username,
  tblAssets.Userdomain,
  Coalesce(tsysOS.Image, tsysAssetTypes.AssetTypeIcon10) As icon,
  tblAssets.IPAddress,
  tsysIPLocations.IPLocation,
  tblAssetCustom.Manufacturer,
  tblAssetCustom.Model,
  tsysOS.OSname As OS,
  tblAssets.SP,
  tblAssets.Lastseen,
  tblAssets.Lasttried,
  Case
    When Chrome.softID Is Null Then '-'
    Else 'Installed'
  End As Chrome,
  Case
    When Edge.AssetID Is Null Then '-'
    Else 'Installed'
  End As Edge,
  Case
    When FireFox.softID Is Null Then '-'
    Else 'Installed'
  End As Firefox,
  Case
    When InternetExplorer.softID Is Null Then '-'
    Else 'Installed'
  End As InternetExplorer,
  Case
    When Opera.softID Is Null Then '-'
    Else 'Installed'
  End As Opera,
  Case
    When Safari.softID Is Null Then '-'
    Else 'Installed'
  End As Safari
From
  tblAssets
  Left Join tsysOS On tsysOS.OScode = tblAssets.OScode
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
  Inner Join tsysIPLocations On tsysIPLocations.LocationID = tblAssets.LocationID
  Inner Join tblState On tblState.State = tblAssetCustom.State
  Left Join (
    Select
    tblSoftware.AssetID,
    tblSoftware.softID
  From
    tblSoftware
    Inner Join tblSoftwareUni On tblSoftwareUni.SoftID = tblSoftware.softID
  Where
      tblSoftwareUni.softwareName Like 'Windows Internet Explorer%'
  ) As InternetExplorer On InternetExplorer.AssetID = tblAssets.AssetID
  Left Join (
    Select
    tblSoftware.AssetID,
    tblSoftware.softID
  From
    tblSoftware
    Inner Join tblSoftwareUni On tblSoftwareUni.SoftID = tblSoftware.softID
  Where
      tblSoftwareUni.softwareName Like '%Mozilla Firefox%'
  ) As FireFox On FireFox.AssetID = tblAssets.AssetID
  Left Join (
    Select
    tblSoftware.AssetID,
    tblSoftware.softID
  From
    tblSoftware
    Inner Join tblSoftwareUni On tblSoftwareUni.SoftID = tblSoftware.softID
  Where
      tblSoftwareUni.softwareName Like '%Google Chrome%'
  ) As Chrome On Chrome.AssetID = tblAssets.AssetID
  Left Join (
    Select
    tblSoftware.AssetID,
    tblSoftware.softID
  From
    tblSoftware
    Inner Join tblSoftwareUni On tblSoftwareUni.SoftID = tblSoftware.softID
  Where
      tblSoftwareUni.softwareName Like '%Safari%'
  ) As Safari On Safari.AssetID = tblAssets.AssetID
  Left Join (
    Select
    tblSoftware.AssetID,
    tblSoftware.softID
  From
    tblSoftware
    Inner Join tblSoftwareUni On tblSoftwareUni.SoftID = tblSoftware.softID
  Where
      tblSoftwareUni.softwareName Like 'Opera%'
  ) As Opera On Opera.AssetID = tblAssets.AssetID
  Left Join (
    Select
    Top 1000000
    tblFileVersions.AssetID
  From
    tblFileVersions
  Where
      tblFileVersions.FilePathfull Like '%\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe'
    And Case
        tblFileVersions.Found
        When 0 Then 'No'
        When 1 Then 'Yes'
      End = 'Yes'
  ) Edge On Edge.AssetID = tblAssets.AssetID
Where
  tblState.Statename = 'Active'
  And tsysAssetTypes.AssetTypename In ('Windows', 'Windows CE')
Order By
  tblAssets.Domain,
  tblAssets.AssetName