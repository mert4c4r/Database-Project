CREATE TRIGGER Stok_Kontrol
ON Kooperatif_Siparis_Detayi
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Urun_ID INT, @Siparis_Adet INT;

    SELECT @Urun_ID = K_Urun_ID, @Siparis_Adet = K_Siparis_Detayi_Adet
    FROM inserted;

    IF (SELECT K_Urun_Stok_Miktari FROM Kooperatif_Urun WHERE K_Urun_ID = @Urun_ID) < @Siparis_Adet
    BEGIN
        
        ROLLBACK TRANSACTION;
        RAISERROR('Stok miktarý yetersiz, iþlem iptal edildi.', 16, 1);
        RETURN;
    END

    UPDATE Kooperatif_Urun
    SET K_Urun_Stok_Miktari = K_Urun_Stok_Miktari - @Siparis_Adet
    WHERE K_Urun_ID = @Urun_ID;
END;
