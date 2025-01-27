CREATE TABLE IF NOT EXISTS students(
    dni VARCHAR(9) NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    surname VARCHAR(200) NOT NULL,
    email VARCHAR(200) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS cycles(
    code VARCHAR(10) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS modules(
    code VARCHAR(10) NOT NULL,
    cycle_code VARCHAR(10) NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, cycle_code),
    CONSTRAINT fk_cycle_code FOREIGN KEY (cycle_code) REFERENCES cycles (code)
);

CREATE TABLE IF NOT EXISTS modules_students(
    module_code VARCHAR(10) NOT NULL,
    module_cycle_code VARCHAR(10) NOT NULL,
    student_dni VARCHAR(9) NOT NULL,
    PRIMARY KEY (module_code, module_cycle_code, student_dni),
    CONSTRAINT fk_module_code_module_cycle_code FOREIGN KEY (module_code, module_cycle_code) REFERENCES modules (code, cycle_code),
    CONSTRAINT fk_student_dni FOREIGN KEY (student_dni) REFERENCES students (dni)
);

DELETE FROM modules_students;
DELETE FROM modules;
DELETE FROM cycles;
DELETE FROM students;

INSERT INTO cycles (code, name) VALUES
('ASIX', 'Administració de Sistemes Informàtics en Xarxa'),
('DAM', 'Desenvolupament d''Aplicacions Multiplataforma'),
('DAW', 'Desenvolupament d''Aplicacions Web');

INSERT INTO modules (code, cycle_code, name) VALUES
('M01', 'ASIX', 'Implantació de sistemes operatius'), 
('M02', 'ASIX', 'Gestió de bases de dades'),
('M03', 'ASIX', 'Programació bàsica'),
('M04', 'ASIX', 'Llenguatges de marques i sistemes de gestió d''informació'),
('M05', 'ASIX', 'Fonaments de maquinari'),
('M06', 'ASIX', 'Administració de sistemes operatius'),
('M07', 'ASIX', 'Planificació i administració de xarxes'),
('M08', 'ASIX', 'Serveis de xarxa i Internet'),
('M09', 'ASIX', 'Implantació d''aplicacions web'),
('M10', 'ASIX', 'Administració de sistemes gestors de bases de dades'),
('M11', 'ASIX', 'Seguretat i alta disponibilitat'),
('M12', 'ASIX', 'Formació i orientació laboral'),
('M13', 'ASIX', 'Empresa i iniciativa emprenedora'),
('M14', 'ASIX', 'Projecte d''administració de sistemes informàtics en xarxa'),
('M15', 'ASIX', 'Formació en centres de treball'),
('M01', 'DAM', 'Sistemes informàtics'), 
('M02', 'DAM', 'Bases de dades'), 
('M03', 'DAM', 'Programació'),
('M04', 'DAM', 'Llenguatges de marques i sistemes de gestió d''informació'),
('M05', 'DAM', 'Entorns de desenvolupament'), 
('M06', 'DAM', 'Accés a dades'), 
('M07', 'DAM', 'Desenvolupament d''interfícies'),
('M08', 'DAM', 'Programació multimèdia i dispositius mòbils'), 
('M09', 'DAM', 'Programació de serveis i processos'),
('M10', 'DAM', 'Sistemes de gestió empresarial'), 
('M11', 'DAM', 'Formació i orientació laboral'),
('M12', 'DAM', 'Empresa i iniciativa emprenedora'), 
('M13', 'DAM', 'Projecte de desenvolupament d''aplicacions multiplataforma'),
('M14', 'DAW', 'Formació en centres de treball'),
('M01', 'DAW', 'Sistemes informàtics'), 
('M02', 'DAW', 'Bases de dades'), 
('M03', 'DAW', 'Programació'),
('M04', 'DAW', 'Llenguatges de marques i sistemes de gestió d''informació'),
('M05', 'DAW', 'Entorns de desenvolupament'), 
('M06', 'DAW', 'Desenvolupament web en l''entorn client'),
('M07', 'DAW', 'Desenvolupament web en l''entorn servidor'), 
('M08', 'DAW', 'Desplegament d''aplicacions web'),
('M09', 'DAW', 'Disseny d''interfícies web'), 
('M10', 'DAW', 'Formació i orientació laboral'),
('M11', 'DAW', 'Empresa i iniciativa emprenedora'), 
('M12', 'DAW', 'Projecte de desenvolupament d''aplicacions web'),
('M13', 'DAW', 'Formació en centres de treball');


INSERT INTO students (dni, name, surname, email) VALUES
('31415926A', 'Ada', 'Lovelace', 'ada@lovelace.was'),
('27182818B', 'Alan', 'Turing', 'alan@turing.uk');

INSERT INTO modules_students (module_code, module_cycle_code, student_dni) VALUES
('M01', 'DAW', '31415926A'),
('M02', 'DAW', '31415926A'),
('M01', 'DAW', '27182818B'),
('M03', 'DAW', '27182818B'),
('M04', 'DAW', '27182818B');

