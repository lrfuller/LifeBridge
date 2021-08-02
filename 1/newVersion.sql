SELECT TOP 10 cprel_News.AutoNumber AS AutoNumber,
    cprel_News.StartDate AS StartDate,
    cprel_News.EndDate AS EndDate,
    cprel_News.IsEnabled AS IsEnabled,
    cprel_News.Title AS Title,
    cprel_News.SubTitle AS Headline,
    cprel_News.Target AS Target,
    cprel_News.Summary AS Summary,
    cprel_News.Image AS Image,
    cprel_News.Author AS Author,
    cprel_News.Subtitle AS Subtitle
FROM cprel_News,
    cpsys_DataCurrent
WHERE cpsys_DataCurrent.Dataid = cprel_News.DataId
    and cpsys_DataCurrent.Attributes.value(
        '(/cpCollection/group/property[@id="Status"]/value)[1]',
        'NVARCHAR(256)'
    ) = 'Current'
    and (
        (cprel_News.StartDate <= GetUTCDate())
        AND (cprel_News.EndDate >= GetUTCDate())
    )
    AND (
        cprel_News.DataId IN (
            SELECT cpsys_DataCurrentInTaxonomy.DataId
            FROM cpsys_DataCurrentInTaxonomy
            WHERE (
                    cpsys_DataCurrentInTaxonomy.TaxonomyId IN ('1b16e72b-d8b3-47d3-9eaa-56be5a08061f')
                )
        )
    )
    AND (cprel_News.IsEnabled = 1)
ORDER BY StartDate DESC