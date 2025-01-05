CREATE TRIGGER Fiyat_Degisim_Finansal_Guncelle
ON Kooperatif_Urun
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF (UPDATE(K_Urun_Fiyat))
    BEGIN
        DECLARE @Kooperatif_ID INT, @Eski_Fiyat DECIMAL(10, 2), @Yeni_Fiyat DECIMAL(10, 2), @Degisim DECIMAL(10, 2);

        SELECT 
            @Kooperatif_ID = I.Kooperatif_ID,
            @Eski_Fiyat = D.K_Urun_Fiyat,
            @Yeni_Fiyat = I.K_Urun_Fiyat
        FROM 
            inserted I
        INNER JOIN 
            deleted D ON I.K_Urun_ID = D.K_Urun_ID;

        SET @Degisim = @Yeni_Fiyat - @Eski_Fiyat;

        IF @Degisim > 0
        BEGIN
            UPDATE Finansal_Veriler
            SET Gelir = ISNULL(Gelir, 0) + @Degisim
            WHERE Kooperatif_ID = @Kooperatif_ID;
        END
        ELSE
        BEGIN
            UPDATE Finansal_Veriler
            SET Gider = ISNULL(Gider, 0) + ABS(@Degisim)
            WHERE Kooperatif_ID = @Kooperatif_ID;
        END
    END
END;
