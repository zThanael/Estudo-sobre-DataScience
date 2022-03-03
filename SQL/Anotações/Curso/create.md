## Criação de tabelas em SQL

Para se criar uma tabela no SQL é necessário seguir uma estrutura de criação. **Exemplo:**

        CREATE TABLE name_table (
            col1 TIPO DE DADO,
            col2 TIPO DE DADO,
            col3 TIPO DE DADO,
            col4 TIPO DE DADO
        )

Olhe agora um exemplo prático da criação de tabelas.

        CREATE TABLE aluno(
            id SERIAL,
            nome VARCHAR(20),
            idade INT,
            PRIMARY KEY (id)
        )
    
> ``id``: refere-se ao identificador da tabela, ou seja o campo que ira identificar o registro

- Primary key: Refere-se ao campo identificado, ela faz com que naquela coluna, não possa existir registros iguais, entre outras configurações

<br>

Quando desejamos que as tabelas criadas se relacionem é necessario que haja uma ligação entre as duas tabelas que queremos.

        CREATE TABLE aluno(
            id SERIAL PRIMARY KEY,
            nome VARCHAR(50)
        )
        
        CREATE TABLE curso(
            id SERIAL PRIMARY KEY,
            nome VARCHAR(50),
            aluno_id INT,
            FOREIGN KEY (aluno_id)
                REFERENCES aluno(id)
        )

> o ``FOREIGN KEY (coluna)`` diz que a ``coluna`` dita nele refere-se a um chave estrangeira.

> o  ``REFERENCES tabela(coluna)`` diz qual a tabela que sera referenciada, no caso acima referenciamos a **tabela aluno** na **coluna id**, lembre-se sempre de referenciar uma coluna que seja a **primary key** da tabela.