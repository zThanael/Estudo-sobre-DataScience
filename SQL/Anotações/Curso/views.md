## ``VIEWS``
Nomear consultas, para utiliza-las futuramente, ou quando for fornecer visualização do seu banco para terceiros, poderiamos disponibilizar somente as VIEWS, deste modo a pessoa tera acesso somente a visualizar os dados dispostos na **VIEW**

- Maior legibilidade
- Maior Segurança
- Perda de Performance

### Criação de uma VIEW

Para criar uma view usa-se o seguinte codigo.

        CREATE VIEW vw_nome_da_view AS
            SELECT 
                categoria.nome AS categoria
                COUNT(curso.id) AS numero_cursos
            FROM categoria
            JOIN curso
                ON curso.categoria_id = categoria.id
            GROUP BY categoria

Para visualizar a view usamos

        SELECT * FROM vw_nome_da_view 

<p align='right'>É interessante colocar <code> vw </code> no inicio do nome, para identifica-la que se trata de uma <b>VIEW</b>

Pode-se utilizar as ``Views`` em ``JOIN``, ``Function`` entre outras funcionalidades que se tem em uma **tabela**.
Ou seja uma View pode-se *usar praticamente como uma tabela*, no quesito de **Consultas** 

> Tomar cuidado com a perda de performance.