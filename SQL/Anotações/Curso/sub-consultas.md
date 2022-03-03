## Operador IN.

> IN : Pesquisar dentro de um intervalo

        SELECT * FROM curso WHERE categoria.id = 1 or categoria.id = 2;

- Equivale:

        SELECT * FROM curso WHERE categoria.id IN (1,2);
      

---
<br>



## HAVING

> Funciona como o WHERE porem dentro do **HAVING** podemos utilizar os resultados das funções agrupadoras (**SUM(),COUNT(),MAX(), entre outras**).

<p align='right'> <b>Obs:</b> Lembrar de utilizar ele sempre depois do <b> GROUP BY </b>

**Exemplo HAVING**

    SELECT curso.nome,
         COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
    JOIN aluno_curso 
        ON aluno_curso.curso_id = curso.id
    GROUP BY 1
        HAVING COUNT(aluno_curso.aluno_id) > 2
    ORDER BY numero_alunos DESC;
    
---
<br>

## Queries Aninhadas

Utilizar o resultado de um query para filtrar na outra query

> Utilizar o IN como uma sub-consulta (SubQuery)

- Funciona passando um SELECT dentro do IN

Exemplo:

        SELECT id FROM categoria WHERE nome NOT LIKE '% %';

- Agora utilizar esta Query dentro do WHERE.

        SELECT * FROM curso WHERE categoria_id IN (
            SELECT id FROM categoria WHERE nome NOT LIKE '% %';
        )

<p align='right'> <b>OBS:</b> Funciona parecido a passar uma lista no python, tipo list comprehension </p>
Exemplo:
<code> 
subquery = [i for i in range(10)]
num = 5
</code> <br>
Agora utilariamos um if para verificar isso. <br>
<code> condicao = print('num Menor que 10') if num in subquery else print('num maior que 10') </code><br>
<p align='right'> Parece confuso mas juro que na minha cabeça faz sentido </p>

--- 
<br>

## Passar uma Query dentro do FROM

> Podemos passar uma query dentro do FROM, ou seja utilizar o resultado da query como uma tabela

**1° Exemplo**.

    SELECT.
        categoria.nome AS Categoria,
        COUNT(curso.id) AS "Numero de Curso"
    FROM categoria
    JOIN curso
        ON curso.categoria_id = categoria.id
    GROUP BY categoria

**2° Exemplo: Analise a seguinte query**.

    SELECT 
        categoria,
        "Numero de Curso"
    FROM *consulta anterior*
        WHERE "Numero de Curso" > 3;

Perceba que não podemos utilizar "Numero de Curso", Categoria nem *consulta anterior* pois não a declaramos nesta **query**, só foi declarado na **query** do 1° exemplo.

Para podermos utilizar estas "Variaveis" que declaramos no **1° exemplo** poderiamos passar o resultado do 1° exemplo dentro do **FROM** do **2° Exemplo.**

**3° Exemplo**.

    SELECT 
        categoria,
        "Numero de Curso"
    FROM (
        SELECT.
            categoria.nome AS Categoria,
            COUNT(curso.id) AS "Numero de Curso"
        FROM categoria
        JOIN curso
            ON curso.categoria_id = categoria.id
        GROUP BY categoria
    )
        WHERE "Numero de Curso" > 3;

Agora podemos utilizar **"Numero de Curso"** e o restante das "Variavéis" pois agora estamos chamando a **query** que cria as "Variavéis".

- #### Outra opção - ``WITH``

Ao utilizar o WITH seria como se declarassemos uma variavel que armazena a **query** para que possamos usa-la futuramente.

**4° Exemplo**.

    WITH consulta_categoria AS (
    SELECT.
        categoria.nome AS Categoria,
        COUNT(curso.id) AS "Numero de Curso"
    FROM categoria
    JOIN curso
        ON curso.categoria_id = categoria.id
    GROUP BY categoria
    ),

Agora ao invez de utilizarmos aquele trecho gigante do **3° Exemplo** que foi mostrado anteriormente. Vamos utilizar o seguinte:

**5° Exemplo**

    SELECT 
        categoria,
        "Numero de Curso"
    FROM consulta_categoria
        WHERE "Numero de Curso" > 3;

Perceba que não utilizamos mais o **SELECT** grande dentro do **FROM**, agora estamos utilizando o ``consulta_categoria`` que age como uma variavel que armazena o **SELECT**, deixando o codigo muito mais entendivel.