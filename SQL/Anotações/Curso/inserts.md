<h1> Maneiras de Realizar INSERT </h1>

<blockquote> <li> Padrão </li></blockquote> <br>
<center> <b>INSERT INTO</b> table (col1,col2....) <br>
<b> VALUES </b> (val1,'val2') </center>

<br>

<blockquote> <li> Mais INSERTS no mesmo comando. </li></blockquote> <br>
<center> <b>INSERT INTO</b> table (col1,col2....) 
<br>
<b> VALUES </b> <br> 
(val1,'val2'), <br> 
(val3,'val4'), <br>
(val5,'val6'), </center>

<br>
<p align='right'><b>Obs:</b> Cada (val1,'val2') refere-se a um novo registro no banco </p> 

<blockquote> <li> INSERT sem declarar a coluna </li></blockquote> <br>
<center> <b>INSERT INTO</b> table
<br>
<b> VALUES </b> <br> 
(val1,'val2'), <br> 
(val3,'val4'), <br>
(val5,'val6'), </center>

<br>
<p align='right'> <b>Obs:</b> table .... significa que ele está chamando todas as colunas da a tabela. ou seja se existirem 5 colunas você precisará especificar as 5 colunas nos <b>VALUES.</b> </p>