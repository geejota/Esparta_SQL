-- Criando um db
CREATE database IF NOT EXISTS Esparta_teste_pt2;


-- Criando as tabelas
CREATE TABLE IF NOT EXISTS ALUNO (
    id INT AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY(id))
    default charset = utf8;


CREATE TABLE IF NOT EXISTS DISCIPLINA (
    id INT AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY(id))
    default charset = utf8;

CREATE TABLE IF NOT EXISTS PROFESSOR (
    id INT AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY(id))
    default charset = utf8;

CREATE TABLE IF NOT EXISTS TURMA (
    id INT AUTO_INCREMENT,
    dia_da_semana INT NOT NULL,
    horario VARCHAR(45) NOT NULL,
    DISCIPLINA_id INT NOT NULL,
    PROFESSOR_id INT NOT NULL,
    ALUNO_id INT NOT NULL,
    FOREIGN KEY(DISCIPLINA_id) references DISCIPLINA(id),
    FOREIGN KEY(PROFESSOR_id) references PROFESSOR(id),
    FOREIGN KEY(ALUNO_id) references ALUNO(id),
    PRIMARY KEY(id))
    default charset = utf8;

CREATE TABLE IF NOT EXISTS ALUNO_TURMA (
    aluno_id INT NOT NULL,
    turma_id INT NOT NULL,
    FOREIGN KEY(aluno_id) references ALUNO(id),
    FOREIGN KEY(turma_id) references TURMA(id)
    PRIMARY KEY(aluno_id)) 
    default charset = utf8;

-- Inserindo dados
INSERT INTO ALUNO (nome)
VALUES ('ANTONIO NUNES'), ('AMANDA PRADO'), ('GUSTAVO HENRIQUE'), ('BRUNO SILVA'), ('DANIEL PETICOR'), ('RODRIGO TEIXEIRA');

INSERT INTO DISCIPLINA (nome)
VALUES ('MATEMATICA'), ('QUIMICA'), ('PORTUGUES'), ('FISICA'), ('HISTORIA');

INSERT INTO PROFESSOR (nome)
VALUES ('JOAO PEDRO'), ('ANGELA APARECIDA'), ('FRANCISCO ROCHA'), ('ALAN SOUZA'), ('EDUARDO PACHECO');

-- Inserindo dados relacinais
INSERT INTO TURMA (dia_da_semana, horario, DISCIPLINA_id, PROFESSOR_id, ALUNO_id)
VALUES  (3,'1hora',1,1,1), 
        (3,'1hora',1,1,2),
        (3,'1hora',1,1,3),
        (3,'1hora',1,1,4),
        (2,'2hora',2,2,1),
        (2,'2hora',2,2,2),
        (2,'2hora',2,2,4),
        (4,'3hora',3,3,2),
        (4,'3hora',3,3,4),
        (4,'3hora',3,3,5),
        (5,'2hora',4,4,1),
        (5,'2hora',4,4,3),
        (5,'2hora',4,4,5),
        (6,'4hora',5,5,1),
        (6,'4hora',5,5,4),
        (6,'4hora',5,5,5);


-- EXERCÍCIOS

-- Exercicio 1 | Buscar os nomes de todos os alunos que frequentam alguma turma do professor 'JOAO PEDRO'.
SELECT A.nome, T.PROFESSOR_id FROM ALUNO AS A INNER JOIN TURMA AS T ON A.id = T.ALUNO_id WHERE T.PROFESSOR_id = 1;



-- Exercício 2 | Buscar os dias da semana que tenham aulas da disciplina 'MATEMATICA'.
SELECT dia_da_semana FROM TURMA WHERE DISCIPLINA_id = 1;


-- Exercício 3 | Buscar todos os alunos que frequentem aulas de 'MATEMATICA' e também 'FISICA'.
SELECT A.nome, T.DISCIPLINA_id FROM ALUNO AS A INNER JOIN TURMA AS T ON A.id = T.ALUNO_id WHERE T.DISCIPLINA_id = 1 OR T.DISCIPLINA_id = 4;


-- Exercício 4 | Buscar as disciplinas que não tenham nenhuma turma.
SELECT DISCIPLINA_ID FROM TURMA WHERE ALUNO_id = null;



-- Exercício 5 | Buscar os alunos que frequentem aulas de 'MATEMATICA' exceto os que frequentem 'QUIMICA'.
SELECT N.nome, D.DISCIPLINA_id FROM ALUNO AS N INNER JOIN (SELECT B.ALUNO_id, B.DISCIPLINA_id FROM TURMA AS B RIGHT JOIN (SELECT A.ALUNO_id, A.DISCIPLINA_id FROM TURMA AS A WHERE A.DISCIPLINA_id IN (2)) AS T ON B.ALUNO_id = T.ALUNO_id WHERE B.DISCIPLINA_id = 1) AS D ON N.id = D.ALUNO_id
