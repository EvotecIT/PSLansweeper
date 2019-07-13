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
  tblQuickFixEngineeringUni.HotFixID,
  tblQuickFixEngineeringUni.Description,
  tblQuickFixEngineeringUni.FixComments,
  tblQuickFixEngineeringInstalledBy.InstalledBy,
  tblQuickFixEngineering.InstalledOn,
  tblQuickFixEngineering.Lastchanged As LastChanged
From
  tblAssets
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
  Inner Join tblState On tblState.State = tblAssetCustom.State
  Inner Join tsysIPLocations On tsysIPLocations.LocationID = tblAssets.LocationID
  Inner Join tblQuickFixEngineering On tblQuickFixEngineering.AssetID = tblAssets.AssetID
  Inner Join tblQuickFixEngineeringUni On tblQuickFixEngineeringUni.QFEID = tblQuickFixEngineering.QFEID
  Left Join tblQuickFixEngineeringInstalledBy On tblQuickFixEngineeringInstalledBy.InstalledByID = tblQuickFixEngineering.InstalledByID
  Left Join tsysOS On tsysOS.OScode = tblAssets.OScode
Where
  tblState.Statename = 'Active'
Order By
  tblAssets.Domain,
  tblAssets.AssetName,
  tblQuickFixEngineeringUni.HotFixID