FUNCTION Main()

    LOCAL cNota1
    LOCAL cNota2
    LOCAL cNota3
    LOCAL cNota4

    // Notas convertidas para n£mero
    LOCAL nNota1
    LOCAL nNota2
    LOCAL nNota3
    LOCAL nNota4

    // Resultado da mÇdia ponderada
    LOCAL nMedia
    hb_cdpSelect("PT850")

    ACCEPT "Informe a 1¶ nota: " TO cNota1
    ACCEPT "Informe a 2¶ nota: " TO cNota2
    ACCEPT "Informe a 3¶ nota: " TO cNota3
    ACCEPT "Informe a 4¶ nota: " TO cNota4

    // ===============================
    // Convers∆o das notas
    // ===============================

    nNota1 := Val(cNota1)
    nNota2 := Val(cNota2)
    nNota3 := Val(cNota3)
    nNota4 := Val(cNota4)

    // ===============================
    // C†lculo da mÇdia ponderada
    // ===============================

    nMedia := (nNota1 * 1 + ;
               nNota2 * 2 + ;
               nNota3 * 3 + ;
               nNota4 * 4) / 10

    // ===============================
    // Exibiá∆o do resultado
    // ===============================

    QOut("")
    QOut("===== MêDIA PONDERADA =====")
    QOut("Nota 1: " + LTrim(Str(nNota1,10,2)))
    QOut("Nota 2: " + LTrim(Str(nNota2,10,2)))
    QOut("Nota 3: " + LTrim(Str(nNota3,10,2)))
    QOut("Nota 4: " + LTrim(Str(nNota4,10,2)))
    QOut("")
    QOut("MÇdia ponderada: " + LTrim(Str(nMedia,10,2)))

RETURN NIL