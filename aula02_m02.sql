CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  curso TEXT NOT NULL
);

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT
);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
  data_matricula DATE DEFAULT CURRENT_DATE
);

INSERT INTO alunos (nome, curso)
VALUES ('Nicolli','Engenharia de Computação'),
       ('Paulo', 'Sistema de Informações'),
       ('Vivian', 'ADM Tech'),
       ('Hugo', 'ADM Tech'),
       ('Luana', 'Sistema de Informação'),
       ('Rafael', 'Engenharia de Computação'),
       ('Eduardo', 'Engenharia de Computação'),
       ('Carlos', 'Engenharia de Computação'),
       ('Felipe', 'Sistema de Informação'),
       ('Luiz', 'ADM Tech');

INSERT INTO cursos (nome, duracao_anos)
VALUES ('Engenharia de Computação', 4),
       ('Sistema de Informação', 3),
       ('ADM Tech', 3);

INSERT INTO matriculas (aluno_id, curso_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 3),
       (5, 2),
       (6, 1),
       (7, 1),
       (8, 1),
       (9, 2),
       (10, 3);

SELECT a.nome AS aluno, c.nome AS curso, m.data_matricula
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;
