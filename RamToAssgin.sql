DECLARE @Tmp table (
					Id int IDENTITY,
					RAM varchar(50)
					)

-- Get total physical memory from the server.
DECLARE @query varchar(1000) = 'powershell.exe "(Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum / 1gb"'

INSERT INTO @Tmp
EXEC xp_cmdshell @query

DECLARE @RAM		int

SELECT @RAM=RAM FROM @Tmp
WHERE Id = 1

DECLARE @Mod8RAM	int
   SET  @Mod8RAM	= @RAM - @RAM%8 
DECLARE @Unit		char(2)
DECLARE @counter bigint

-- Enter the unit in which the assignment is to be converted [GB MB KB B]

SET @Unit		 = 'GB'
SET @counter =  CASE @Unit 
				WHEN 'GB' THEN 1		  -- Gigabyte
				WHEN 'MB' THEN 1024		  -- Megabyte
				WHEN 'KB' THEN 1048576    -- Kilobyte
				WHEN 'B'  THEN 1073741824 -- Byte
				ELSE 1 END

-- SQLServer >= 2014 --  IIF / CONCAT - SQLServer 2014 and higher
--SELECT CONCAT(IIF(@RAM>=16,(@RAM-((@Mod8RAM - 16)/8 + 4))*@counter, @RAM-4),' ',@Jm) AS RamToAssign

SELECT CASE WHEN @RAM >= 16 THEN CONVERT(varchar(20),(@RAM-((@Mod8RAM - 16)/8 + 4))*@counter) ELSE CONVERT(varchar(20),@RAM-4) END + ' ' + @Unit AS RamToAssign
