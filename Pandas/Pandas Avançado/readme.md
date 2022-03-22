
<img src ='https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Pandas_logo.svg/1200px-Pandas_logo.svg.png' width='px'>


# Pandas: Avançado

#### Notebook
- Caso deseje visualizar os codigos e entender mais sobre este assunto veja o notebook onde contem os códigos.

> Acesse o [notebook](https://github.com/zThanael/Estudo-sobre-DataScience/blob/main/Pandas/Panda%20b%C3%A1sico/Resumo.ipynb)

Este tópico de tratando e analisando dados é resultado do acompanhamento do curso ``Python Pandas: Técnicas avançadas`` da **Alura**

No notebook foi demonstrado todo o processo para realizar um tratamento dos dados, passando por etapas primordiais como.

- *Importação e ajuste dos dados provindos de JSON e EXCEL*
- *Tratamento, transformação e extração de texto dos DataFrames*
- *Concatenação entre objetos no Pandas*
- *Estilização do DataFrame*


# Etapas

- ### Importação e ajuste dos dados.
No notebook precisamos utilizar dados provindos de um arquivo JSON e de um arquivo excel, porém ambos os arquivos tem suas particularidades, no excel por exemplo queremos uma planilha em especifico, para isso precisamos ajustar o script para pegar somente a parte desejada.
No arquivo JSON ele vem com uma visualização estranha, para ajustar precisamos utilizar o ``json_normalize()``
> Para entender mais sobre isso acesse o [Notebook]() ou caso queria saber mais sobre importação de arquivos acesse a pasta [Pandas Input Output]()

- ### Manipulação de dados.
Durante esta etapa, visualizamos como tratar os dados do DataFrame, como por exemplo, a manipulação de strings e arrays, tornando póssivel extrair arrays, converter eles, e até mesmo criar colunas no DataFrame com eles, também foi visto brevemente sobre as RegEx
> O pandar facilita muito na manipulação de strings, usamos **Series** do pandas com ``.str`` para executar funções built-in de strings do python em todos os elementos da **Series** sem ter de criar um for para isso.

- ### Concatenação entre objetos no Pandas.
Para realizar a junção de DataFrames temos diversos meios, mas o mais interessante é por meio do merge, que atua igual o join do SQL, onde podemos passar diversos parametros, como tipo de ligação (inner, left, right, full), se desejamos passar os index. para entender mais sobre o merge basta acessar a [Documentação](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.merge.html).
> Outras formas mais simples de adicionar objetos ao DataFrame é com o ``append()`` e com o ``concat``

- ### Estilização do DataFrame.
Para melhorar a visualização de um DataFrame podemos utilizar o metodo ``style``, onde podemos passar mascaras para os valores, formatação de texto, como deixar determinados valores em negritos ou até mesmo mudar sua cor e propriedades.

- ## Observações
Gostaria de lembra-los que para entender melhor é necessário visualizar o  [notebook]() onde todos os codigos são mostrados, assim facilitando o entendimento do conteúdo.