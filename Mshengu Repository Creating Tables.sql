--- Creating data tables Rreference daat tables) to be used in the model ---

  Drop Table IF EXISTS [Refdata].[ActivityMetric]
    Create table [Refdata].[ActivityMetric] ( 
    
    AMKEY int Primary KEY IDENTITY (1,1),
    Metric varchar(255),
    UoM_ID int NOT NULL,
    Unittype_ID int NOT NULL,
    SDG_ID int NOT NULL,
    RAG_ID int NOT NULL
    );
  
  Drop TABLE IF EXISTS [Refdata].[SGD_Weigtings]
    CREATE TABLE [Refdata].[SGD_Weigtings] (

      Weight_ID int PRIMARY KEY IDENTITY(1,1),
      AMKEY INT NOT NULL,
      SDG_1  DECIMAL(20,5) check (SDG_1 between 0 and 1), --- The "Check" feature ensures each column is up to 100% or 1,  
      SDG_2  DECIMAL(20,5) check (SDG_2 between 0 and 1),   ---- [There is an opportunity to get a feature that check that the sum of SDG 1 - 5 equates to 100% or 1]
      SDG_3  DECIMAL(20,5) check (SDG_3 between 0 and 1), 
      SDG_4  DECIMAL(20,5) check (SDG_4 between 0 and 1), 
      SDG_5  DECIMAL(20,5) check (SDG_5 between 0 and 1),
      SDG_CHECK DECIMAL(20,5) check (SDG_CHECK = 1),
    )
            SET IDENTITY_INSERT [Refdata].[SGD_Weigtings] ON  ---- SET IDENTITY_INSERT create ability to insert user defined values into a field defined as an IDENTITY column (keys)---
            
            
 Drop TABLE IF EXISTS [Refdata].[UnitOfMeasure]
    CREATE TABLE [Refdata].[UnitOfMeasure] (

      UoM_ID int PRIMARY KEY IDENTITY(1,1),
      Unit_Name  VARCHAR(50),
    );

 Drop TABLE IF EXISTS [Refdata].[UnitType]
    CREATE TABLE [Refdata].[UnitType] (

      Unittype_ID int PRIMARY KEY IDENTITY(1,1),
      Unittype_Name  VARCHAR(50),
    );

 Drop TABLE IF EXISTS [Refdata].[SGD_Items]
    CREATE TABLE [Refdata].[SGD_Items] (

      SDG_ID int PRIMARY KEY IDENTITY(1,1),
      SDG_Name  VARCHAR(50),
    );

 Drop TABLE IF EXISTS [Refdata].[Period_Rank]
    CREATE TABLE [Refdata].[Period_Rank] (

      Period_ID int PRIMARY KEY IDENTITY(1,1),
      Fin_Year DATE NOT NULL
    )

 Drop TABLE IF EXISTS [Refdata].[RAG_Indicator]
    CREATE TABLE [Refdata].[RAG_Indicator] (

      RAG_ID int PRIMARY KEY IDENTITY(1,1),
      RAG_Name VARCHAR(50) NOT NULL
    )


/**** Assessment sheet and Comapny input table below****/

 DROP TABLE IF EXISTS [load].[Assessment Sheet]
    CREATE TABLE [load].[Assessment Sheet] (

      Organization VARCHAR(255) NOT NULL,
      Company VARCHAR(255) NOT NULL,
      AMKEY INT NOT NULL,
      Metric  VARCHAR(255),
      [2019] Decimal(20,2),
      [2020] Decimal(20,2),
      [2021] Decimal(20,2),
      [2022] Decimal(20,2),
      [2023] Decimal(20,2)

    )


  DROP TABLE IF EXISTS [Refdata].[Company]
    CREATE TABLE [Refdata].[Company] (

      Company VARCHAR(255) NOT NULL,
      Company_ID INT NOT NULL,
      Primary_Company INT  --- Put "1" on the Priamry Comapny only whether one or more compoanies are provided ---
    )