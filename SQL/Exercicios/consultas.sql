-- Exercicios de SELECT --

-- 1. Listar os alunos e seus devidos cursos
select 
	a.primeiro_nome,
	c.nome 
from aluno a 
join aluno_curso ac 
	on a.id = ac.aluno_id 
join curso c 
	on c.id = ac.curso_id 

-- Listar quantos cursos cada aluno está fazendo
select 
	a.primeiro_nome  as Nome,
	COUNT(ac.curso_id)	 as "Numero de Cursos"
from aluno a
join aluno_curso ac 
	on ac.aluno_id = a.id 
group by 1
order by "Numero de Cursos" desc, 1 asc; 

-- Listar quantos alunos cada curso tem.
select 
	c.nome,
	cat.nome as Categoria,
	count(ac.aluno_id) as Alunos
from curso c 
join aluno_curso ac 
	on ac.curso_id = c.id 
join categoria cat
	on cat.id = c.categoria_id 
group by 1,2
order by Alunos desc, c.nome asc

-- Listar quantos alunos cada categoria tem.
select 
	cat.nome,
	count(ac.aluno_id) as Alunos 
from categoria cat
join curso c
	on c.categoria_id = cat.id 
join aluno_curso ac 
	on ac.curso_id = c.id 
group by cat.nome 
order by Alunos desc, cat.nome asc
