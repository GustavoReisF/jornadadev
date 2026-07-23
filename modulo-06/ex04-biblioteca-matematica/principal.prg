SET PROCEDURE TO matematica.prg

FUNCTION Main()

    hb_cdpSelect("PT850")

    QOut("===== TESTE DA BIBLIOTECA =====")

    QOut(FatorialN(5))

    QOut(EhPrimo(7))

    QOut(EhPrimo(8))

    QOut(MDC(12, 18))
    QOut(MDC(15, 25))
    QOut(MDC(7, 3))

    QOut(MMC(12, 18))
    QOut(MMC(15, 25))
    QOut(MMC(7, 3))

RETURN NIL