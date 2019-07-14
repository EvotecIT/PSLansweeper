Select
  Top 1000000
  tblSoftwareUni.softwareName As Software,
  tblSoftware.softwareVersion As Version,
  tblSoftwareUni.SoftwarePublisher As Publisher,
  Count(tblSoftware.AssetID) As Total
From
  tblSoftware
  Inner Join tblAssets On tblSoftware.AssetID = tblAssets.AssetID
  Inner Join tblSoftwareUni On tblSoftware.softID = tblSoftwareUni.SoftID
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
Where
  tblAssetCustom.State = 1
Group By
  tblSoftwareUni.softwareName,
  tblSoftware.softwareVersion,
  tblSoftwareUni.SoftwarePublisher
Order By
  Total Desc