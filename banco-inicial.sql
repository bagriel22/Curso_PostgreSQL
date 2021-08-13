CREATE DATABASE alura;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES ('Gabriel', 'Oliveira', '25-05-1999' );
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES ('Maicon', 'Jobim', '1998-10-21' );
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES ('Henrique', 'Boneto', '1999-01-02' );


SELECT * FROM aluno;
SELECT * FROM categoria;
SELECT * FROM curso;
SELECT * FROM aluno_curso;

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO categoria (nome) VALUES ('BI e Data Warehouse'), ('Analise de Dados'), ('Front-End');


CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

INSERT INTO curso (nome, categoria_id) VALUES ('SQL Server/Power BI', 1);
INSERT INTO curso (nome, categoria_id) VALUES ('Phyton', 2);
INSERT INTO curso (nome, categoria_id) VALUES ('ReactJs', 3);


CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO aluno_curso VALUES (1,1), (2,3), (3,2);

	SELECT aluno.primeiro_nome,
		   aluno.ultimo_nome,
			COUNT (aluno_curso.aluno_id) numero_cursos
		FROM aluno
		JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
		GROUP BY 1, 2
		ORDER BY numero_cursos DESC
		LIMIT 1;
	
	SELECT curso.nome,
			COUNT (aluno_curso.aluno_id) numero_alunos
		FROM curso
		JOIN aluno_curso ON  aluno_curso.curso_id = curso.id
GROUP BY 1
ORDER BY numero_alunos DESC
	LIMIT 1;

