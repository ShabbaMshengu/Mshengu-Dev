--- Add a column to the USS_BRIDGE ---

ALTER Table [uss].[BRIDGE]
    ADD [USS_tcfdrefdataID] NVARCHAR(50) NULL  --- specify the new column name, start with "USS_" then the column name ---

--- Update the info/content of the new column from [esg_DEV_master].[master].[ACTIVITYMETRIC] ---

UPDATE [uss].[BRIDGE]
    SET USS_tcfdrefdataID = [esg_DEV_master].[master].[ACTIVITYMETRIC].[refdataTcfdid]   --- set the new column name to equals to the desired column from the spefied table and Database if pulled from a diff databases ---
FROM  [esg_DEV_master].[master].[ACTIVITYMETRIC]

JOIN [uss].[BRIDGE] ON [uss].[BRIDGE].[USS_activitymetricID] = [esg_DEV_master].[master].[ACTIVITYMETRIC].[activitymetricid] where BRIDGESCHEME = 'ACTIVITYMETRIC'  --- Select Activity metric since the additional column is coming from the Activity Metric Table. ---