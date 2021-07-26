SELECT TOP 10 cprel_SiteMap.[DataId] AS [DataId],
    cprel_SiteMap.[AutoNumber] AS [AutoNumber],
    cprel_SiteMap.[StartDate] AS [StartDate],
    cprel_SiteMap.[EndDate] AS [EndDate],
    cprel_SiteMap.[IsEnabled] AS [IsEnabled],
    cprel_SiteMap.[Title] AS [Title],
    cprel_SiteMap.[Target] AS [Target],
    cprel_SiteMap.[Summary] AS [Summary],
    cprel_SiteMap.[Image] AS [Image],
    cpsys_DataCurrent.Attributes [cp:scripting key='SqlColumnBackgroundColorIndicatingNewOrModifiedContentToUser' tableName='cprel_SiteMap' days='14' newContentBackgroundColor='#CEF2CE' modifiedContentBackgroundColor='#FFFFCC' Format=', {0}'/]
FROM cprel_SiteMap
    INNER JOIN cpsys_DataCurrent ON cprel_SiteMap.DataId = cpsys_DataCurrent.DataId
ORDER BY cprel_SiteMap.ModifyDate DESC