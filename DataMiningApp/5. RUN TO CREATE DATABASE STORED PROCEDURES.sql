USE [DMP]
GO

/****** Object:  StoredProcedure [dbo].[WEBAPP_GETLAYOUT]    Script Date: 05/11/2010 04:06:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WEBAPP_GETLAYOUT] (@algorithmid int, @stepid int) AS

SELECT LAYOUT_X, LAYOUT_Y, ROWSPAN, COLSPAN, CONTROL_TYPE, ISNULL(FILL_DATANAME,''), ISNULL(OUTPUT_DATANAME,''), ISNULL(VALUE,'') FROM WEBAPP_LAYOUT WHERE ALGORITHM_ID = @algorithmid AND STEP_ID = @stepid

GO

/****** Object:  StoredProcedure [dbo].[WEBAPP_READ]    Script Date: 05/11/2010 04:06:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[WEBAPP_READ] (@JOBID int, @DATANAME varchar(50)) AS 

SELECT ROW_ID, COLUMN_ID, VALUE FROM ALGORITHM_DATASTORE WHERE JOB_ID = @JOBID AND DATA_NAME = @DATANAME ORDER BY ROW_ID, COLUMN_ID

GO

/****** Object:  StoredProcedure [dbo].[WEBAPP_SELECTCONST]    Script Date: 05/11/2010 04:06:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WEBAPP_SELECTCONST] (@algorithmid int, @stepid int, @rowid int, @colid int) AS

SELECT VALUE FROM WEBAPP_LAYOUT WHERE ALGORITHM_ID = @algorithmid AND STEP_ID = @stepid AND LAYOUT_X = @rowid AND LAYOUT_Y = @colid
GO

/****** Object:  StoredProcedure [dbo].[WEBAPP_TABLESIZE]    Script Date: 05/11/2010 04:06:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WEBAPP_TABLESIZE] (@algorithmid int, @stepid int) AS

SELECT ISNULL(MAX(LAYOUT_X),0), ISNULL(MAX(LAYOUT_Y),0) FROM WEBAPP_LAYOUT WHERE ALGORITHM_ID = @algorithmid AND STEP_ID = @stepid

GO

/****** Object:  StoredProcedure [dbo].[WEBAPP_WRITE]    Script Date: 05/11/2010 04:06:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[WEBAPP_WRITE] (@JOB_ID int, @DATA_NAME varchar(50), @ROW_ID int, @COLUMN_ID int, @VALUE varchar(50)) AS 

INSERT INTO ALGORITHM_DATASTORE(JOB_ID, DATA_NAME, ROW_ID, COLUMN_ID, VALUE)
VALUES
(@JOB_ID, @DATA_NAME, @ROW_ID, @COLUMN_ID, @VALUE)


GO

