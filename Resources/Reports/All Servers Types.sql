Select
  Top 1000000 tblAssets.AssetID,
  tblAssets.AssetUnique,
  tblAssets.Domain,
  tsysOS.OSname,
  tsysOS.Image As icon,
  RTrim(
    LTrim(
      Coalesce(tblOperatingsystem.Caption, '') + ' ' + Coalesce(tblOperatingsystem.OtherTypeDescription, '')
    )
  ) As OS,
  tblOperatingsystem.Lastchanged
From
  tblComputersystem
  Inner Join tblAssets On tblComputersystem.AssetID = tblAssets.AssetID
  Inner Join tblOperatingsystem On tblAssets.AssetID = tblOperatingsystem.AssetID
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode
Where
  tblComputersystem.Domainrole > 1
  And tblAssetCustom.State = 1
Order By
  tblAssets.AssetName