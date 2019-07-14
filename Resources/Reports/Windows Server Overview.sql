Select Top (1000000)
    tblAssets.AssetName As [Name],
    tblAssets.AssetID,
    tsysOS.Image As icon,
    RTrim(LTrim(Coalesce(tblOperatingsystem.Caption, '') + ' ' +
  Coalesce(tblOperatingsystem.OtherTypeDescription, ''))) As [OS Version],
    tblAssetCustom.Model As [Model/Platform],
    tblAssets.Processor As [Model CPU],
    tblAssets.NrProcessors,
    Sum(tblProcessor.NumberOfCores) As [CPU Cores],
    dbo.tsysIPLocations.IPLocation
From tblComputersystem
    Inner Join tblAssets On tblComputersystem.AssetID = tblAssets.AssetID
    Inner Join tblOperatingsystem
    On tblAssets.AssetID = tblOperatingsystem.AssetID
    Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
    Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode
    Inner Join tblProcessor On tblAssets.AssetID = tblProcessor.AssetID
    Left Outer Join tsysIPLocations On tblAssets.IPNumeric >=
    tsysIPLocations.StartIP And tblAssets.IPNumeric <= tsysIPLocations.EndIP
Group By tblAssets.AssetName,
  tblAssets.AssetID,
  tsysOS.Image,
  RTrim(LTrim(Coalesce(tblOperatingsystem.Caption, '') + ' ' +
  Coalesce(tblOperatingsystem.OtherTypeDescription, ''))),
  tblAssetCustom.Model,
  tblAssets.Processor,
  tblAssets.NrProcessors,
  tblAssets.AssetUnique,
  tsysIPLocations.IPLocation
Having RTrim(LTrim(Coalesce(tblOperatingsystem.Caption, '') + ' ' +
  Coalesce(tblOperatingsystem.OtherTypeDescription, ''))) Like '%Server%'
Order By tblAssets.AssetName