CREATE FUNCTION getAge (@birthDay date)
RETURNS tinyint 
AS 
BEGIN
RETURN (
        SELECT
          CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR,@birthDay, GETDATE()), @birthDay) > GETDATE()
          THEN DATEDIFF(YEAR, @birthDay, GETDATE()) -1
          ELSE DATEDIFF(YEAR, @birthDay, GETDATE())
          END
          )
END
GO
