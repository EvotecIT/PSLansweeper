Select Top 1000000
    tblAssets.AssetID,
    tblAssets.Domain,
    tsysOS.OSname,
    tsysOS.Image As icon,
    ProcCapacity.CPU,
    ProcCapacity.Name,
    ProcCapacity.MaxClockSpeed As ClockSpeed,
    ProcCapacity.NrOfProcessors As #CPU
From tblAssets
    Inner Join (Select tblAssets.AssetID,
        Max(tblProcessor.MaxClockSpeed) As MaxClockSpeed,
        Count(tblProcessor.WIN32_PROCESSORid) As NrOfProcessors,
        Max(tblProcessor.MaxClockSpeed) As [total Proc Capacity],
        Max(tblProcessor.Architecture) As Architecture,
        Max(tblProcessor.Caption) As Name,
        Max(Replace(Replace(tblProcessor.Name, '(R)', ''), '(TM)', '')) As CPU
    From tblAssets
        Inner Join tblProcessor On tblAssets.AssetID = tblProcessor.AssetID
    Group By tblAssets.AssetID) ProcCapacity On ProcCapacity.AssetID =
    tblAssets.AssetID
    Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
    Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode
Where tblAssetCustom.State = 1
Order By #CPU Desc,
  tblAssets.AssetName