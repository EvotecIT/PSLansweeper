Select
  Top 1000000
  tsysAssetTypes.AssetTypeIcon10 As icon,
  tblAssets.AssetName,
  tblAssetCustom.Printerstatus As Status,
  tblAssetCustom.Printedpages As [Printed Pages],
  tblAssetCustom.Model As [Device  model],
  tblAssets.Lastseen,
  tblAssets.AssetID
From
  tblAssets
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysAssetTypes On tblAssets.Assettype = tsysAssetTypes.AssetType
Where
  tblAssetCustom.Printedpages Is Not Null
  And tblAssetCustom.State = 1
Order By
  tblAssets.AssetName