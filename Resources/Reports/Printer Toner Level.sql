Select Top 1000000
    tsysAssetTypes.AssetTypeIcon10 As icon,
    tblAssets.AssetName,
    tblAssetCustom.Model As [Device  model],
    tblCustDevPrinter.AssetID,
    Floor(tblCustDevPrinter.TonerRemaining / tblCustDevPrinter.TonerMaximum *
  100) As [Remaining %],
    tblCustDevPrinter.Tonername,
    tblCustDevPrinter.Lastchanged
From tblCustDevPrinter
    Inner Join tblAssets On tblCustDevPrinter.AssetID = tblAssets.AssetID
    Inner Join tsysAssetTypes On tblAssets.Assettype = tsysAssetTypes.AssetType
    Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
Where Floor(tblCustDevPrinter.TonerRemaining / tblCustDevPrinter.TonerMaximum *
  100) >= 0 And tblCustDevPrinter.TonerMaximum > 0 And tblAssetCustom.State = 1
Order By [Remaining %]