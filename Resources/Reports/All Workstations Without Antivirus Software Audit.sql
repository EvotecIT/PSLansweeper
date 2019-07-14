Select
  Top 1000000
  tsysOS.Image As icon,
  tblAssets.AssetID,
  tblAssets.AssetName,
  tblAssets.Domain,
  tblAssets.Username,
  tblAssets.Userdomain,
  tblAssets.IPAddress,
  tblAssets.Description,
  tblAssetCustom.Manufacturer,
  tblAssetCustom.Model,
  tblAssetCustom.Location,
  tsysIPLocations.IPLocation,
  tsysOS.OSname As OS,
  tblAssets.SP As SP,
  tblAssets.Firstseen,
  tblAssets.Lastseen
From
  tblAssets
  Inner Join tblComputersystem On tblAssets.AssetID = tblComputersystem.AssetID
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode
  Left Join tsysIPLocations On tsysIPLocations.StartIP <= tblAssets.IPNumeric
    And tsysIPLocations.EndIP >= tblAssets.IPNumeric
  Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
Where
  tblAssets.AssetID Not In (
    Select
    tblSoftware.AssetID
  From
    tblSoftware
    Inner Join tblSoftwareUni On tblSoftwareUni.SoftID = tblSoftware.softID
    Inner Join tsysantivirus On tblSoftwareUni.softwareName Like tsysantivirus.Software
  )
  And tblAssets.AssetID Not In (
    Select
    tblAntivirus.AssetID
  From
    tblAntivirus
  )
  And tblComputersystem.Domainrole <= 1
  And tblAssetCustom.State = 1
Order By
  tblAssets.AssetName