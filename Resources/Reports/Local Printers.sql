Select Top 1000000
  tblAssets.AssetID,
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
  tblPrinters.Caption As Printer,
  tblPrinters.Portname As PrinterPort,
  tblPrinters.Printprocessor,
  tblPrinters.Capabilitydescriptions As PrinterCapabilities,
  tblPrinters.Lastchanged
From tblAssets
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tblState On tblState.State = tblAssetCustom.State
  Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
  Inner Join tsysIPLocations On tsysIPLocations.LocationID =
    tblAssets.LocationID
  Inner Join tblPrinters On tblAssets.AssetID = tblPrinters.AssetID
  Left Join tsysOS On tblAssets.OScode = tsysOS.OScode
Where tblPrinters.Portname Not Like '%.%.%.%' And tblPrinters.Printprocessor <>
  'WinPrint' And Case tblPrinters.Network
    When 0 Then 'No'
    When 1 Then 'Yes'
  End = 'No' And Case tblPrinters.Local
    When 0 Then 'No'
    When 1 Then 'Yes'
  End = 'Yes' And tblState.Statename = 'Active'
Order By tblAssets.Domain,
  tblAssets.AssetName,
  Printer