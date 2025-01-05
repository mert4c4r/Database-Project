BEGIN TRANSACTION;

BEGIN TRY
    INSERT INTO Kooperatif_Siparis (K_Siparis_ID, Uye_ID, K_Siparis_Tarihi, K_Toplam_Tutar)
    VALUES (101, 1, GETDATE(), 500.00);

    INSERT INTO Kooperatif_Siparis_Detayi (K_Siparis_Detayi_ID, K_Siparis_ID, K_Urun_ID, K_Siparis_Detayi_Adet, K_Siparis_Detayi_Fiyat)
    VALUES (201, 101, 1, 10, 50.00);

    UPDATE Kooperatif_Urun
    SET K_Urun_Stok_Miktari = K_Urun_Stok_Miktari - 10
    WHERE K_Urun_ID = 1;

        IF EXISTS (SELECT * FROM Kooperatif_Urun WHERE K_Urun_Stok_Miktari < 0)
    BEGIN
        THROW 50001, 'Stok yetersiz! Ýþlem iptal ediliyor.', 1;
    END;

    
    COMMIT TRANSACTION;
    PRINT 'Sipariþ baþarýyla eklendi ve stok güncellendi.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluþtu: ' + ERROR_MESSAGE();
END CATCH;
