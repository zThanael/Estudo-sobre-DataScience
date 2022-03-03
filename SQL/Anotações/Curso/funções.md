## ``Funções de Strings``

- ### Concatenação de Strings
> Realizar a junção de strings

- **Exemplo: Juntar o nome com o sobrenome.**

        SELECT 
            (nome || ' ' || sobrenome) AS "Nome Completo"
        FROM aluno;

<p align='right'> Caso o sobrenome fosse NULL, o resultado seria somente <b> NULL </b>

Caso deseje ignorar valores nulos, é utilizado sempre a função ``CONCAT()``

- **Exemplo com CONCAT**

        SELECT 
            CONCAT(nome,' ',sobrenome) as "Nome Completo"
        FROM aluno;

### Outras funções:
- UPPER: faz com que todos os caracteres fiquem MAIUSCULOS
- TRIM: Remove todos os espaços (' ') do começo e do fim da string

> Caso queria ver todas as funções de STRING acesse a [Documentação Oficial do PostgreSQL](https://www.postgresql.org/docs/9.1/functions-string.html)


--- 

<br>

## ``Funções de data``

Calcular Idade: Utiliza a função NOW()

- ``NOW()``
> Retorna a data atual, podese utilizar 
``NOW()::DATE``. os " :: " significa conversão, ou seja no exemplo estamos convertando a data atual de TIMESTAMP para DATE, como o retorno de DATE é em dias, precisariamos converter isso para anos fazendo uma divisão por **365**

- **Exemplo pegar Idade**

        SELECT 
            (NOW()::DATE - data_nascimento) / 365 AS "Idade"
        FROM alunos

> Neste exemplo, o ``NOW()::DATE`` retorna a data atual em dias. ao diminuir a data atual com a data_nascimento, obtem-se a idade da pessoa em dias, para ter em anos precisamos somente dividir sobre **365**.

- ``AGE()``

Ou podemos simplesmente utilizar a função ``AGE()`` passando por parametro a data de nascimento e o postgres ja retorna o valor exato.
- **Exemplo pegar Idade**

        SELECT
            AGE(data_nascimento) as "Idade"
        FROM alunos
    
Esta função retornará com exatidão a idade, porem retornara os meses e dias juntos. <br>
Exemplo: **22 years 8 mons 20 days**

para extrair algumas informações da data usamos o ``EXTRACT()``

- ``EXTRACT()``:
> Serve para extrair informações da data, como queremos extrair o ano utilizamos.

        SELECT 
            EXTRACT(YEAR FROM AGE(data_nascimento))AS "Idade
        FROM alunos

> Caso queria ver todas as funções de DATA acesse a [Documentação Oficial do PostgreSQL](https://www.postgresql.org/docs/9.1/functions-datetime.html)

--- 

<br>

## ``Funções Matemáticas``

Utiliza-se os mesmo operadores matemáticos de uma linguagem de programação.

- Operadores:
![](https://basedatos2.files.wordpress.com/2015/03/4.png)

> Caso queria ver todas as funções MATEMÁTICAS acesse a [Documentação Oficial do PostgreSQL](https://www.postgresql.org/docs/9.5/functions-math.html)

--- 

<br>

## ``Conversões``

Funções para conversão de tipos de dados

- ``TO_CHAR(timestamp,text)``:
Função utilizada para converter dados para CHAR

        SELECT TO_CHAR(NOW(),'DD/MM'YYYY');

> DD/MM/YYYY: refere-se ao formato da data, dia-mes-ano

<br>

> Caso queria ver todas as funções acesse a [Documentação Oficial do PostgreSQL](https://www.postgresql.org/docs/current/functions.html)

