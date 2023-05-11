--- Creating data tables Rreference daat tables) to be used in the model ---

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


Drop Table IF EXISTS [Refdata].[ActivityMetric]
    Create table [Refdata].[ActivityMetric] ( 
    
    AMKEY int Primary KEY IDENTITY (1,1),
    Metric varchar(50),
    UoM_ID int NOT NULL,
    Unit_Type_ID int NOT NULL,
    SDG_ID int NOT NULL,

    FOREIGN KEY (UoM_ID) REFERENCES [Refdata].[UnitOfMeasure] (UoM_ID),
    FOREIGN KEY (Unit_Type_ID) REFERENCES [Refdata].[UnitType] (Unittype_ID),
    FOREIGN KEY (SDG_ID)REFERENCES [Refdata].[SGD_Items] (SDG_ID)
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

      FOREIGN KEY (AMKEY) REFERENCES [Refdata].[ActivityMetric] (AMKEY)
    )

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