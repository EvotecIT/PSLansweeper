Select
  Top 1000000 tblAssets.AssetID,
  tblAssets.AssetName,
  tblAssets.Domain,
  tsysAssetTypes.AssetTypename As AssetType,
  tblAssets.Username,
  tblAssets.Userdomain,
  tsysAssetTypes.AssetTypeIcon10 As icon,
  tblAssets.IPAddress,
  tsysIPLocations.IPLocation,
  tblAssetCustom.Manufacturer,
  tblAssetCustom.Model,
  Coalesce(
    tsysOS.OSname,
    tblLinuxSystem.OSRelease,
    tblMacOSInfo.SystemVersion
  ) As OS,
  tblAssets.SP,
  tblAssets.Lastseen,
  tblAssets.Lasttried,
  Convert(
    nvarchar(10),
    Ceiling(
      Floor(Convert(integer, tblAssets.Uptime) / 3600 / 24)
    )
  ) + ' days ' + Convert(
    nvarchar(10),
    Ceiling(
      Floor(Convert(integer, tblAssets.Uptime) / 3600 % 24)
    )
  ) + ' hours ' + Convert(
    nvarchar(10),
    Ceiling(
      Floor(Convert(integer, tblAssets.Uptime) % 3600 / 60)
    )
  ) + ' minutes' As UptimeSinceLastReboot
From
  tblAssets
  Left Join tsysOS On tsysOS.OScode = tblAssets.OScode
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
  Inner Join tsysIPLocations On tsysIPLocations.LocationID = tblAssets.LocationID
  Inner Join tblState On tblState.State = tblAssetCustom.State
  Left Join tblLinuxSystem On tblAssets.AssetID = tblLinuxSystem.AssetID
  Left Join tblMacOSInfo On tblAssets.AssetID = tblMacOSInfo.AssetID
Where
  tblState.Statename = 'Active'
  And tblAssets.Uptime Is Not Null
Order By
  tblAssets.Uptime Desc,
  tblAssets.IPNumeric,
  tblAssets.Domain,
  tblAssets.AssetName