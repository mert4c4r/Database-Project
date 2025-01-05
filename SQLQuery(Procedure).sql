CREATE PROCEDURE SiparisStokGuncelle (
    @K_Urun_ID INT,
    @Adet INT
)
AS
BEGIN
    UPDATE Kooperatif_Urun
    SET K_Urun_Stok_Miktari = K_Urun_Stok_Miktari - @Adet
    WHERE K_Urun_ID = @K_Urun_ID;
END;

Kullanýmý:
EXEC SiparisStokGuncelle @K_Urun_ID = 1, @Adet = 5;
