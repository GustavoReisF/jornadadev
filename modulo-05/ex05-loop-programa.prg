FUNCTION Main()
    LOCAL cNome, cDisc, nMedia, cResposta
    LOCAL nNota1, nNota2, cNota1, cNota2

    WHILE .T.

        WHILE .T.
            ACCEPT "Digite o Nome: " TO cNome
            
            IF Len(Trim(cNome)) > 0
                EXIT

            ELSE 

                QOut("Nome inv lido!")

            ENDIF
            
        ENDDO

        WHILE .T. 
            ACCEPT "DIgite a disciplina: " TO cDisc

            IF Len(cDisc) == 3 .AND. cDisc == Upper(cDisc)
                EXIT

            ELSE

                QOut("Disciplina inv lida!")

            ENDIF

        ENDDO

        WHILE .T.
            ACCEPT "Digite a primeira nota: " TO cNota1

            nNota1 := Val(cNota1)

            IF nNota1 >= 0 .AND. nNota1 <= 10
                EXIT

            ELSE 

                QOut("Nota inv lida!")

            ENDIF

        ENDDO

        WHILE .T.
            ACCEPT "Digite a segunda nota: " TO cNota2

            nNota2 := Val(cNota2)

            IF nNota2 >= 0 .AND. nNota2 <= 10
                EXIT

            ELSE 

                QOut("Nota inv lida!")

            ENDIF

        ENDDO

        nMedia := (nNota1 + nNota2) / 2

        QOut("")
        QOut("Nome: " + cNome)
        QOut("Disciplina: " + cDisc)
        QOut("Primeira nota: " + LTrim(str(nNota1)))
        QOut("Segunda nota: " + LTrim(str(nNota2)))
        QOut("M‚dia: " + LTrim(str(nMedia)))

        ACCEPT "Deseja calcular outro? (S/N): " TO cResposta

        IF Upper(cResposta) <> "S"
                EXIT
            ENDIF

    ENDDO

RETURN NIL