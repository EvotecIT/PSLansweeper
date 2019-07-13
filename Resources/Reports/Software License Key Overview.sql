Select
  Top 1000000 tblAssets.AssetID,
  tblAssets.AssetUnique,
  tblAssets.Domain,
  tsysOS.OSname,
  tblSerialnumber.Product,
  tblSerialnumber.ProductID,
  tblSerialnumber.ProductKey,
  tsysOS.Image As icon
From
  tblAssets
  Inner Join tblSerialnumber On tblAssets.AssetID = tblSerialnumber.AssetID
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode
Where
  tblAssetCustom.State = 1
Order By
  tblAssets.AssetUnique,
  tblSerialnumber.Product