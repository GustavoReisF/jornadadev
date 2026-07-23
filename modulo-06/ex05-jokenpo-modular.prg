PROCEDURE Main()

    LOCAL cJogador
    LOCAL cCPU
    LOCAL cResultado
    LOCAL cContinuar

    cContinuar := "S"

    DO WHILE Upper(cContinuar) == "S"

        ACCEPT "Digite PEDRA, PAPEL ou TESOURA: " TO cJogador

        DO WHILE !ValidarJogada(cJogador)

            QOut("Jogada inválida!")

            ACCEPT "Digite novamente: " TO cJogador

        ENDDO

        cJogador := Upper(AllTrim(cJogador))

        cCPU := SortearJogadaCPU()

        cResultado := DefinirVencedor(cJogador, cCPU)

        QOut("")
        QOut("Sua jogada : " + cJogador)
        QOut("CPU jogou  : " + cCPU)
        QOut("Resultado  : " + cResultado)
        QOut("")

        ACCEPT "Jogar novamente? (S/N): " TO cContinuar

        cContinuar := Upper(AllTrim(cContinuar))

    ENDDO

    QOut("")
    QOut("Fim de jogo!")

RETURN


FUNCTION SortearJogadaCPU()

    LOCAL nSorteio

    nSorteio := hb_RandomInt(1, 3)

    DO CASE

    CASE nSorteio == 1
        RETURN "PEDRA"

    CASE nSorteio == 2
        RETURN "PAPEL"

    OTHERWISE
        RETURN "TESOURA"

    ENDCASE

RETURN NIL


FUNCTION ValidarJogada(cJogada)

    cJogada := Upper(AllTrim(cJogada))

    DO CASE

    CASE cJogada == "PEDRA"
        RETURN .T.

    CASE cJogada == "PAPEL"
        RETURN .T.

    CASE cJogada == "TESOURA"
        RETURN .T.

    OTHERWISE
        RETURN .F.

    ENDCASE

RETURN NIL


FUNCTION DefinirVencedor(cJogador, cCPU)

    IF cJogador == cCPU
        RETURN "EMPATE"
    ENDIF

    IF (cJogador == "PEDRA" .AND. cCPU == "TESOURA") .OR. ;
       (cJogador == "PAPEL" .AND. cCPU == "PEDRA") .OR. ;
       (cJogador == "TESOURA" .AND. cCPU == "PAPEL")

        RETURN "JOGADOR"

    ENDIF

RETURN "CPU"