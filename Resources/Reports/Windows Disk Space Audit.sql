Select
  Top 1000000
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
  tblDiskdrives.Caption As Drive,
  Cast(
    tblDiskdrives.Freespace / 1024 / 1024 / 1024 As numeric
  ) As FreeGB,
  Cast(
    tblDiskdrives.Size / 1024 / 1024 / 1024 As numeric
  ) As TotalSizeGB,
  Ceiling(
    tblDiskdrives.Freespace / (
      Case
        tblDiskdrives.Size
        When 0 Then 1
        Else tblDiskdrives.Size
      End
    ) * 100
  ) As [%SpaceLeft],
  Case
    When Ceiling(
      tblDiskdrives.Freespace / (
        Case
          tblDiskdrives.Size
          When 0 Then 1
          Else tblDiskdrives.Size
        End
      ) * 100
    ) < 10 Then '#f7caca'
    When Ceiling(
      tblDiskdrives.Freespace / (
        Case
          tblDiskdrives.Size
          When 0 Then 1
          Else tblDiskdrives.Size
        End
      ) * 100
    ) < 30 Then '#f7f0ca'
  End As backgroundcolor,
  tblDiskdrives.Lastchanged As LastChanged
From
  tblAssets
  Inner Join tblDiskdrives On tblAssets.AssetID = tblDiskdrives.AssetID
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
  Inner Join tblState On tblState.State = tblAssetCustom.State
  Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype
  Inner Join tsysIPLocations On tsysIPLocations.LocationID = tblAssets.LocationID
  Left Join tsysOS On tblAssets.OScode = tsysOS.OScode
Where
  Cast(
    tblDiskdrives.Size / 1024 / 1024 / 1024 As numeric
  ) <> 0
  And tblState.Statename = 'Active'
  And Case
    tblDiskdrives.DriveType
    When 3 Then 'Local Disk'
  End = 'Local Disk'
Order By
  [%SpaceLeft],
  tblAssets.Domain,
  tblAssets.AssetName,
  Drive