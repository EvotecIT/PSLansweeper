
  Select
    Top 1000000
    tblAssets.AssetID,
    tblAssets.AssetName,
    tblAssets.Domain,
    tsysAssetTypes.AssetTypename As AssetType,
    tblAssets.Username,
    tblAssets.Userdomain,
    tsysAssetTypes.AssetTypeIcon10 As icon,
    tblAssets.IPAddress,
    tblSoftwareUni.softwareName As Software,
    tblSoftware.softwareVersion As Version,
    tblSoftwareUni.SoftwarePublisher As Publisher,
    Case
    When tblSoftware.softwareVersion LIKE '75%' Then 'Up to date'
    Else 'Out of date'
  End As [Patch Status],
    tsysIPLocations.IPLocation,
    tblAssetCustom.Manufacturer,
    tblAssetCustom.Model,
    tsysOS.OSname As OS,
    tblAssets.SP,
    tblAssets.Lastseen,
    tblAssets.Lasttried,
    tblSoftware.Lastchanged,
    Case
    When tblSoftware.softwareVersion LIKE '75%' Then '#d4f4be'
    Else '#ffadad'
  End As backgroundcolor
  From
    tblAssets
    Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
    Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
    Inner Join tsysIPLocations On tsysIPLocations.LocationID = tblAssets.LocationID
    Inner Join tblState On tblState.State = tblAssetCustom.State
    Inner Join tblSoftware On tblAssets.AssetID = tblSoftware.AssetID
    Inner Join tblSoftwareUni On tblSoftwareUni.SoftID = tblSoftware.softID
    Left Join tsysOS On tsysOS.OScode = tblAssets.OScode
  Where
  tblSoftwareUni.softwareName Like '%Google Chrome%'
    And tblState.Statename = 'Active'
Union
  Select
    Top 1000000
    tblAssets.AssetID,
    tblAssets.AssetName,
    tblAssets.Domain,
    tsysAssetTypes.AssetTypename As AssetType,
    tblAssets.Username,
    tblAssets.Userdomain,
    tsysAssetTypes.AssetTypeIcon10 As icon,
    tblAssets.IPAddress,
    tblSoftwareUni.softwareName As Software,
    tblMacApplications.Version As Version,
    tblSoftwareUni.SoftwarePublisher As Publisher,
    Case
    When tblMacApplications.Version LIKE '75%' Then 'Up to date'
    Else 'Out of date'
  End As [Patch Status],
    tsysIPLocations.IPLocation,
    tblAssetCustom.Manufacturer,
    tblAssetCustom.Model,
    tblMacOSInfo.SystemVersion As OS,
    tblAssets.SP,
    tblAssets.Lastseen,
    tblAssets.Lasttried,
    tblMacApplications.LastChanged,
    Case
    When tblMacApplications.Version LIKE '75%' Then '#d4f4be'
    Else '#ffadad'
  End As backgroundcolor
  From
    tblAssets
    Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
    Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
    Inner Join tsysIPLocations On tsysIPLocations.LocationID = tblAssets.LocationID
    Inner Join tblState On tblState.State = tblAssetCustom.State
    Inner Join tblMacApplications On tblAssets.AssetID = tblMacApplications.AssetID
    Inner Join tblSoftwareUni On tblSoftwareUni.SoftID = tblMacApplications.softid
    Inner Join tblMacOSInfo On tblMacOSInfo.AssetID = tblAssets.AssetID
  Where
  tblSoftwareUni.softwareName Like '%Google Chrome%'
    And tblState.Statename = 'Active'
Union
  Select
    Top 1000000
    tblAssets.AssetID,
    tblAssets.AssetName,
    tblAssets.Domain,
    tsysAssetTypes.AssetTypename As AssetType,
    tblAssets.Username,
    tblAssets.Userdomain,
    tsysAssetTypes.AssetTypeIcon10 As icon,
    tblAssets.IPAddress,
    tblSoftwareUni.softwareName As Software,
    tblLinuxSoftware.Version As Version,
    tblSoftwareUni.SoftwarePublisher As Publisher,
    Case
    When tblLinuxSoftware.Version LIKE '75%' Then 'Up to date'
    Else 'Out of date'
  End As [Patch Status],
    tsysIPLocations.IPLocation,
    tblAssetCustom.Manufacturer,
    tblAssetCustom.Model,
    tblLinuxSystem.OSRelease As OS,
    tblAssets.SP,
    tblAssets.Lastseen,
    tblAssets.Lasttried,
    tblLinuxSoftware.LastChanged,
    Case
    When tblLinuxSoftware.Version LIKE '75%' Then '#d4f4be'
    Else '#ffadad'
  End As backgroundcolor
  From
    tblAssets
    Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
    Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
    Inner Join tsysIPLocations On tsysIPLocations.LocationID = tblAssets.LocationID
    Inner Join tblState On tblState.State = tblAssetCustom.State
    Inner Join tblLinuxSoftware On tblAssets.AssetID = tblLinuxSoftware.AssetID
    Inner Join tblSoftwareUni On tblSoftwareUni.SoftID = tblLinuxSoftware.SoftwareUniID
    Inner Join tblLinuxSystem On tblAssets.AssetID = tblLinuxSystem.AssetID
  Where
  tblSoftwareUni.softwareName Like '%google-chrome%'
    And tblState.Statename = 'Active'
Order By
  Domain,
  AssetName,
  Software