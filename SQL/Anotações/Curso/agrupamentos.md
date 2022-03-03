## Funções de agregação

São funções na qual consguimos agrupar os valores em um resultado

### `` COUNT ()``
> Conta os registros, passa como parametro sempre um campo.

        SELECT
            COUNT(*)
        FROM alunos

### ``SUM ()``
> Realiza a soma dos valores.

        SELECT 
            SUM(id)
        FROM alunos


### ``DISTINC``
Faz com que os dados não se repitam

        SELECT DISTINCT
            nome
        FROM aluno


### ``GROUP BY``
serve para agrupar os valores de acordo com a coluna passada por parametro.

        SELECT  
            nome
            COUNT(id)
        FROM aluno
        GROUP BY nome
        
    
### ``ORDER BY ``
Realiza a ordenação dos resultado de acordo com a coluna e o tipo de ordenamento informado

        SELECT
            nome
        FROM aluno
        ORDER BY aluno ASC

> ASC significa ascendet = ordem crescente, alfabetica.
> DESC significa decrescente    
        