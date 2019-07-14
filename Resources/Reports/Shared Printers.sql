Select Top 1000000
    tblAssets.AssetID,
    tblAssets.AssetUnique,
    tblAssets.Domain,
    tblAssets.Description,
    tsysOS.OSname,
    tblSharesUni.Name,
    tblSharesUni.Path,
    tblShares.Lastchanged,
    tsysOS.Image As icon
From tblShares
    Inner Join tblAssets On tblShares.AssetID = tblAssets.AssetID
    Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
    Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode
    Inner Join tblSharesUni On tblShares.ShareUniqueID =
    tblSharesUni.ShareUniqueID
Where tblAssetCustom.State = 1 And tblSharesUni.Type = 1
Order By tblAssets.AssetName