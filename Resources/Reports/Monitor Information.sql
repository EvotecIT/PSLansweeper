Select Top 1000000 tsysOS.Image As icon,
  tblAssets.AssetID,
  tblAssets.AssetName,
  tblMonitor.MonitorManufacturer As [Manufacturer Monitor],
  tblMonitor.MonitorModel,
  tblMonitor.SerialNumber,
  tblMonitor.ManufacturedDate,
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
From tblAssets
  Inner Join tblMonitor On tblMonitor.AssetID = tblAssets.AssetID
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode
  Left Join tsysIPLocations On tsysIPLocations.StartIP <= tblAssets.IPNumeric
    And tsysIPLocations.EndIP >= tblAssets.IPNumeric
Where tblAssetCustom.State = 1
Order By tblAssets.AssetName