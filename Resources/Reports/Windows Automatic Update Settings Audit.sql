Select
  Top 1000000 tblAssets.AssetID,
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
    tblRegistry.Value
    When '5' Then 'Automatic Updates is required, but end users can configure it'
    When '4' Then 'Automatic download and scheduled installation'
    When '3' Then 'Automatic download and notify of installation'
    When '2' Then 'Notify before download'
    When '1' Then 'Never check for updates'
    Else 'Unknown, try rescanning the machine'
  End As UpdateSettings
From
  tblAssets
  Left Join tsysOS On tsysOS.OScode = tblAssets.OScode
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
  Inner Join tsysIPLocations On tsysIPLocations.LocationID = tblAssets.LocationID
  Inner Join tblState On tblState.State = tblAssetCustom.State
  Left Join tblRegistry On tblRegistry.AssetID = tblAssets.AssetID
Where
  tblState.Statename = 'Active'
  And tsysAssetTypes.AssetTypename In ('Windows', 'Windows CE')
  And tblRegistry.Valuename = 'auoptions'
Order By
  tblAssets.Domain,
  tblAssets.AssetName