#define PI 3.14159

FUNCTION Main()

    // Exercício 2A
    LOCAL cRaio
    LOCAL nRaio
    LOCAL nArea

    // Exercício 2B
    LOCAL cCatetoA
    LOCAL cCatetoB
    LOCAL nCatetoA
    LOCAL nCatetoB
    LOCAL nHipotenusa

    // Exercício 2C
    LOCAL cPeso
    LOCAL cAltura
    LOCAL nPeso
    LOCAL nAltura
    LOCAL nIMC

    // ===============================
    // Exercício 2A - Área do círculo
    // ===============================
    QOut("===== EXERCÍCIO 2A =====")

    ACCEPT "Informe o raio do círculo: " TO cRaio

    nRaio := Val(cRaio)
    nArea := PI * (nRaio ^ 2)

    QOut("Área do círculo: " + Str(nArea,10,2))
    QOut("")
    QOut("===== EXERCÍCIO 2B =====")
    
    // ===============================
    // Exercício 2B - Hipotenusa
    // ===============================

    ACCEPT "Informe o primeiro cateto: " TO cCatetoA
    ACCEPT "Informe o segundo cateto: " TO cCatetoB

    nCatetoA := Val(cCatetoA)
    nCatetoB := Val(cCatetoB)
    nHipotenusa := Sqrt((nCatetoA ^ 2) + (nCatetoB ^ 2))
    
    QOut("Hipotenusa: " + Str(nHipotenusa,10,2))
    QOut("")
    // ===============================
    // Exercício 2C - IMC
    // ===============================
    QOut("===== EXERCÍCIO 2C =====")
    ACCEPT "Informe o peso (kg): " TO cPeso
    ACCEPT "Informe a altura (m): " TO cAltura

    nPeso := Val(cPeso)
    nAltura := Val(cAltura)
    nIMC := nPeso / (nAltura ^ 2)

    QOut("IMC: " + Str(nIMC,10,2))

RETURN NIL