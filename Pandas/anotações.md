# Anotações curso de Pandas

## Podemos ler dados diretamente de alguma página HTML
**``df_html = pd.read_html('https://www.federalreserve.gov/releases/h3/current/default.htm')``**
> Ao executar o comando acima o df_html se torna um array contendo ``todos os DataFrames`` encontrados no link do parametro

**``df_html[0] ``**: Equivale ao 1 DataFrame da página.

Também podemos ler aquivos. xlsw,json,txt,csv. entre outros para saber quais os tipos so verificar na documentação ou escrever pd.read_ (Shift Tab) Para o autocomplete mostrar os possiveis comandos. 

---
<br>

## Remoção de dados duplicados do pandas.
> **Utilizar o ``df.drop_duplicates()``**

- Podemos também ao inves de sempre utilizar 
``df = df.drop_duplicates()`` Utilizar

``df.drop_duplicates(inplace=True)``: este comando faz com que ele sobrescreva a variavél

---
<br>

## Renomear os indexs
Para renomear os index podemos utilziar o seguinte comando
``tipos_imoveis.index = range(tipos_imoveis.shape[0])`` o range ali serve para que renomeamos os index seguindo a ordem crescente indo de de 0 até n

---
<br>

## Criação 
### Criação de Series

Podemos criar um ``Series`` através de um array.

    data = [1,2,3,4,5]
    data_serie = pd.Series(data)

Caso não queiramos o index que vem por padrão no Pandas, podemos utilizar o parametro index e passar um array para que substitua o index padrão

    index = ['linha1','linha2','linha3']
    valores = [1,2,3]
    data_serie = pd.Series(valores,index)

Quando se cria as Series através de um dicionario, não precisamos definir os data e o index, pois o pandas pegar os valores do dicionario então só precisamos passar o dicionario

### Criando um DataFrame

    data = [[1,2,3],
            [4,5,6],
            [7,8,9]]
    df1 = pd.DataFrame(data = data)
    
Neste comando pois não declaramos as colunas o pandas por padrão irá declarar essas colunas como numeros indo de 0 até n

    index = [f'linha {i}' for i in range(3)]
    columns = [f'coluna {i}' for i in range(3)]
    df1 = pd.DataFrame(data = data, index = index, columns = columns)

Para criar o DataFrame a partir de um dicionario, só precisamos chamar o dicionario

    df2 = pd.DataFrame(dicionario)

### Concatenação de DataFrames

    df4 = pd.concat([df1, df2, df3])

    se adicionar axis = 1 ele irá criar novas colunas ao lado para concatenar os valores.

---
<br>

## Filtrando o DataFrame para trazer somente as categorias que desejo

- 1° Criamos uma lista com os valores que desejamos manter no DataFrame

        exemplo = ['Quitinete','Casa','Apartamento']


- 2° Utilizamos o metodo ``isin()`` que ira retornar uma **Series** contendo True or False, True caso a linha do DataFrame contenha algum valor da lista passado por Parametro, e False caso o valor não esteja no parametro

        selecao = df['Tipos'].isin(exemplo)
        selecao receberá algo como 
        0   True
        1   True
        2   False
        dependendo do valor
    
- 3° Chamamos ``df[selecao]`` é o pandas nos mostrará somente os valores onde a linha em selecao seja True

        df_filtrado = df[selecao]

Obs: Podemos usar tanto o isin() ou podemos usar:

        selecao = (df['Tipo'] == 'Quitinete') || (df['Tipo'] == 'Casa')

> Este jeito é melhor caso tenhamos poucas condições ou condições mais complexas

---
<br>

## LOC e ILOC
Quando desejamos localizar os registros e obter sua linha podemos usar tanto o LOC quanto o ILOC

- A principal diferença é que o ILOC trabalha com o número dos index (registros), enquanto que o LOC trabalha com os valores do registro.

        df.loc[0,'Tipo']
        df.iloc[0,1]
Podemos também utilizar o Slicing neles

        df.loc[0:4,['Tipo','Quartos']]
    
---
<br>

## Criação e remoção de colunas

### Criação de novas Colunas

Basta passarmos o nome da coluna que desejamos criar e seu valor

    df['Valor Bruto'] = df['Valor'] + df['IPTU']

### Remoção de Colunas

Podemos remover as colunas por tres meios

- del df['coluna']

- df.pop('coluna')

E o melhor que é

- ``dados.drop(['coluna', 'coluna2'], axis = 1, inplace = True)``
> axis = 1 significa que é coluna

---
<br>

## Agrupamentos

Funcionam muito parecido ao **SQL** tanto que o comando é

    df_grupo = df.groupby('Coluna')

Para visualizarmos os grupos podemos usar
    
    df_grupo.groups

isto irá retornar um dicionario contendo cada agrupamento da coluna é como valor os indices onde eles se encontram no df

Exemplo

    {'Casa':([2,9,7,3]),
     'Apartamento':([10,20,30,25,1,4,8])}

> Ou seja estes valores são os indices das linhas que possuem este valor no df

Podemos percorrer dentro dos groups utilizando FOR ou simplementes passando uma função de agregação a ele.

    df_grupo['Valor'].mean()

---
<br>

## Tratamento de NULOS

Existem algumas maneiras de visualizar os dados que estão faltando uma delas é o

- df.info() : que irá mostrar as colunas não-nulas

- df.isnull() : Retornará um dataFrame com valores Bolean onde o True significa valor nulo

- df.notnull(): inverso do isnull, onde os nulos são False

podemos usar o isnull e o not null como seleção

    df[df['Valor'].isnull()]

### Dropar os valores nulos

para remover os nulos usamos a função ``dropna()``, como parametro temos de passar o subset = ['coluna'] que refere-se a coluna onde os nulos se encontram

    df.dropna(subset=['Valor'], inplace = True)

Porem podem existir campos onde voce nao queira apagar os nulos, mas sim substitui-los. para isso usamos o ``fillna()``

podendo escolher o valor dos nulos de cada coluna ou simplesmente passsando um valor geral

    df = df.fillna(0)  #Todos os nulos serão 0 agora
    df = df.fillna({'IPTU':0,'Condomínio':0}) # so os nulos de condominio e do IPTU serão 0

--- 
<br>

## Identificando os OutLiers

Mesmo apagando os nulos podem existir dados que estão errados, como por exemplos os outliers onde podem aparecer valores totalmente diferentes como por exemplo um aluguel de 1 milhao

- Para identificar esses valores, vamos utilizar os gráficos de boxplot, onde mostram os valores aceitaveis e os que estão fora da linha de aceitação.

<img src='Curso Pandas/Box-Plot.png' width=100%>

Para isso só precisamos replicar as formulas no python, dentro do [Notebook]() fica mais entendivel.

Após apagar os outliers, obtemos um DataFrame mais suscinto e correto.