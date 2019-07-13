Select
  Top 1000000 tblAssets.AssetID,
  tblAssets.AssetName,
  tblAssets.Domain,
  tsysAssetTypes.AssetTypename As AssetType,
  tblAssets.Username,
  tblAssets.Userdomain,
  tsysAssetTypes.AssetTypeIcon10 As icon,
  tblAssets.IPAddress,
  Case
    When tblSoftware.softwareVersion >= '68.0'
    And tblSoftwareUni.softwareName Like '%firefox%' Then 'Up to date'
    When tblSoftware.softwareVersion >= '60.8.0'
    And tblSoftwareUni.softwareName Like '%firefox%ESR%' Then 'Up to date'
    Else 'Out of date'
  End As [Patch Status],
  tblSoftwareUni.softwareName As Software,
  tblSoftware.softwareVersion As Version,
  tblSoftwareUni.SoftwarePublisher As Publisher,
  tsysIPLocations.IPLocation,
  tblAssetCustom.Manufacturer,
  tblAssetCustom.Model,
  tsysOS.OSname As OS,
  tblAssets.SP,
  tblSoftware.Lastchanged,
  tblAssets.Lastseen,
  tblAssets.Lasttried,
  Case
    When tblSoftware.softwareVersion >= '68.0'
    AND tblSoftwareUni.softwareName Like '%firefox%' Then '#d4f4be'
    When tblSoftware.softwareVersion >= '60.8.0'
    AND tblSoftwareUni.softwareName Like '%firefox%ESR%' Then '#d4f4be'
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
  tblSoftwareUni.softwareName Like '%firefox%'
  And tblState.Statename = 'Active'
Union
Select
  Top 1000000 tblAssets.AssetID,
  tblAssets.AssetName,
  tblAssets.Domain,
  tsysAssetTypes.AssetTypename As AssetType,
  tblAssets.Username,
  tblAssets.Userdomain,
  tsysAssetTypes.AssetTypeIcon10 As icon,
  tblAssets.IPAddress,
  Case
    When tblMacApplications.Version >= '68.0'
    And tblSoftwareUni.softwareName Like '%firefox%' Then 'Up to date'
    When tblMacApplications.Version >= '60.8.0'
    And tblSoftwareUni.softwareName Like '%firefox%ESR%' Then 'Up to date'
    Else 'Out of date'
  End As [Patch Status],
  tblSoftwareUni.softwareName As Software,
  tblMacApplications.Version As Version,
  tblSoftwareUni.SoftwarePublisher As Publisher,
  tsysIPLocations.IPLocation,
  tblAssetCustom.Manufacturer,
  tblAssetCustom.Model,
  tblMacOSInfo.SystemVersion As OS,
  tblAssets.SP,
  tblMacApplications.LastChanged,
  tblAssets.Lastseen,
  tblAssets.Lasttried,
  Case
    When tblMacApplications.Version >= '68.0'
    AND tblSoftwareUni.softwareName Like '%firefox%' Then '#d4f4be'
    When tblMacApplications.Version >= '60.8.0'
    AND tblSoftwareUni.softwareName Like '%firefox%ESR%' Then '#d4f4be'
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
  tblSoftwareUni.softwareName Like '%firefox%'
  And tblState.Statename = 'Active'
Union
Select
  Top 1000000 tblAssets.AssetID,
  tblAssets.AssetName,
  tblAssets.Domain,
  tsysAssetTypes.AssetTypename As AssetType,
  tblAssets.Username,
  tblAssets.Userdomain,
  tsysAssetTypes.AssetTypeIcon10 As icon,
  tblAssets.IPAddress,
  Case
    When tblLinuxSoftware.Version >= '68.0'
    And tblSoftwareUni.softwareName Like '%firefox%' Then 'Up to date'
    When tblLinuxSoftware.Version >= '60.8.0'
    And tblSoftwareUni.softwareName Like '%firefox%ESR%' Then 'Up to date'
    Else 'Out of date'
  End As [Patch Status],
  tblSoftwareUni.softwareName As Software,
  tblLinuxSoftware.Version As Version,
  tblSoftwareUni.SoftwarePublisher As Publisher,
  tsysIPLocations.IPLocation,
  tblAssetCustom.Manufacturer,
  tblAssetCustom.Model,
  tblLinuxSystem.OSRelease As OS,
  tblAssets.SP,
  tblLinuxSoftware.LastChanged,
  tblAssets.Lastseen,
  tblAssets.Lasttried,
  Case
    When tblLinuxSoftware.Version >= '68.0'
    AND tblSoftwareUni.softwareName Like '%firefox%' Then '#d4f4be'
    When tblLinuxSoftware.Version >= '60.8.0'
    AND tblSoftwareUni.softwareName Like '%firefox%ESR%' Then '#d4f4be'
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
  (
    tblSoftwareUni.softwareName Like '%firefox%'
    And tblSoftwareUni.softwareName Not Like '%locale%'
  )
  And tblState.Statename = 'Active'
Order By
  Domain,
  AssetName,
  Software