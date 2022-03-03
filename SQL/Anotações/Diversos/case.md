## CASE WHEN
Case é uma expressão condicional que funciona muito similar ao ``Swith/case do JavaScript``. Onde voce passa diversas opções para os select, e caso ele caia em uma dessas opções ele fará alguma coisa.

Exemplo da ideia:

num = 4

        CASE
            num = 1 FAÇA ALGO
            num = 2 FAÇA ALGO
            num = 3 FAÇA ALGO
            num = 4 FAÇA ALGO
        END

Nesta ideia acima, sabemos que como o num é 4 ele ira entrar na quarta opção, essa é a ideia do case, agora veremos ela no **postgreSQL**

        SELECT 
            time,
            CASE
                WHEN time = 'A' THEN 'Amarela'
                WHEN time = 'B' THEN 'Azul'
                WHEN time = 'C' THEN 'Vermelho'
            END
            AS cor_uniforme
        FROM time_futebol

> Assim como em linguagem de programação podemos fazer um ``ELSE``, para caso o registro não se encontre em uma das condições citadas.

        SELECT 
            time,
            CASE
                WHEN time = 'A' THEN 'Amarela'
                WHEN time = 'B' THEN 'Azul'
                WHEN time = 'C' THEN 'Vermelho'
                ELSE 'Sem Camisa'
            END
            AS cor_uniforme
        FROM time_futebol

<p align='right'> Verificar com o Geovane para tirar algumas dúvidas a respeito do CASE. </p>

#### Dúvidas
- Ele seria como um ``WHERE``? porem no inicio do ``SELECT``
