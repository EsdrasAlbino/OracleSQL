-- =====================================================================
-- ARQUIVO: povoa_banco.sql
-- DESCRIÇÃO: Script para inserir dados de exemplo nas tabelas do banco.
--            Os dados são coerentes e demonstram um fluxo de uso.
-- BANCO DE DADOS: Oracle
-- =====================================================================

-- Pessoas
INSERT INTO PESSOA (CPF, Nome, Email, Data_Nascimento, Sexo) VALUES ('11122233344', 'Carlos Santana', 'carlos.santana@email.com', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 'M');
INSERT INTO PESSOA (CPF, Nome, Email, Data_Nascimento, Sexo) VALUES ('55566677788', 'Ana Carolina', 'ana.carolina@email.com', TO_DATE('1992-02-20', 'YYYY-MM-DD'), 'F');
INSERT INTO PESSOA (CPF, Nome, Email, Data_Nascimento, Sexo) VALUES ('99988877766', 'Roberto Silva', 'roberto.silva@email.com', TO_DATE('1978-11-30', 'YYYY-MM-DD'), 'M');
INSERT INTO PESSOA (CPF, Nome, Email, Data_Nascimento, Sexo) VALUES ('12345678900', 'Fernanda Lima', 'fernanda.lima@email.com', TO_DATE('1995-07-25', 'YYYY-MM-DD'), 'F');
INSERT INTO PESSOA (CPF, Nome, Email, Data_Nascimento, Sexo) VALUES ('00987654321', 'Juliano Alves', 'juliano.alves@email.com', TO_DATE('1988-09-10', 'YYYY-MM-DD'), 'M');

-- Telefones
INSERT INTO PESSOA_TELEFONE(CPF, Telefone) VALUES ('11122233344', '81999887766');
INSERT INTO PESSOA_TELEFONE(CPF, Telefone) VALUES ('55566677788', '11988776655');

-- Clínicas
INSERT INTO CLINICA (Nome, Endereco) VALUES ('Clínica Vida e Saúde', 'Rua das Flores, 123, Boa Viagem, Recife');
INSERT INTO CLINICA (Nome, Endereco) VALUES ('Centro Médico Parnamirim', 'Avenida Parnamirim, 500, Parnamirim, Recife');

-- Salas
INSERT INTO SALA_EXAME(Codigo_Clinica, Numero_Sala) VALUES (1, 101); -- Sala de Raio-X na Clínica 1
INSERT INTO SALA_EXAME(Codigo_Clinica, Numero_Sala) VALUES (1, 102); -- Sala de Tomografia na Clínica 1
INSERT INTO SALA_EXAME(Codigo_Clinica, Numero_Sala) VALUES (2, 201); -- Sala de Ultrassom na Clínica 2

-- Funcionários (alguns serão médicos, outros técnicos)
INSERT INTO FUNCIONARIO(CPF, Matricula, Data_Admissao) VALUES ('99988877766', 'F001', TO_DATE('2010-01-15', 'YYYY-MM-DD')); -- Roberto Silva (será o médico)
INSERT INTO FUNCIONARIO(CPF, Matricula, Data_Admissao) VALUES ('12345678900', 'F002', TO_DATE('2018-03-12', 'YYYY-MM-DD')); -- Fernanda Lima (será a técnica)
INSERT INTO FUNCIONARIO(CPF, Matricula, Data_Admissao, CPF_Supervisor) VALUES ('00987654321', 'F003', TO_DATE('2020-08-01', 'YYYY-MM-DD'), '99988877766'); -- Juliano Alves (supervisionado pelo Dr. Roberto)

-- Especializações (Médico e Técnico)
INSERT INTO MEDICO(CPF, CRM) VALUES ('99988877766', 'CRM-PE 12345');
INSERT INTO TECNICO(CPF, Certificacao) VALUES ('12345678900', 'CRTR-PE 6789');

-- Pacientes
INSERT INTO PACIENTE(CPF, Numero_Cartao) VALUES ('11122233344', 'SUS123456789');
INSERT INTO PACIENTE(CPF, Numero_Cartao) VALUES ('55566677788', 'PLANO987654321');

-- Especialidades e Exames (tabelas de domínio)
INSERT INTO ESPECIALIDADE (Nome) VALUES ('Cardiologia');
INSERT INTO ESPECIALIDADE (Nome) VALUES ('Radiologia');
INSERT INTO MEDICO_ESPECIALIDADE(CPF_Medico, Codigo_Especialidade, Data_Obtencao) VALUES ('99988877766', 2, TO_DATE('2012-05-20', 'YYYY-MM-DD')); -- Dr. Roberto é Radiologista

INSERT INTO EXAME (Nome, Tipo) VALUES ('Raio-X do Tórax', 'Imagem');
INSERT INTO EXAME (Nome, Tipo) VALUES ('Tomografia Computadorizada', 'Imagem');

-- Equipamentos e Alocação
INSERT INTO EQUIPAMENTO(Numero_Serie, Tipo_Equipamento) VALUES ('RX-BR-MODELO-5000', 'Raio-X');
INSERT INTO EQUIPAMENTO(Numero_Serie, Tipo_Equipamento) VALUES ('TOMO-SIEMENS-XYZ', 'Tomógrafo');
INSERT INTO ALOCACAO_EQUIPAMENTO(Numero_Serie_Equipamento, Codigo_Clinica, Numero_Sala, Data_Hora_Inicio) VALUES ('RX-BR-MODELO-5000', 1, 101, TO_TIMESTAMP('2025-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- FLUXO COMPLETO: AGENDAMENTO -> REALIZAÇÃO -> LAUDO -> DIAGNÓSTICO
-- 1. Agendamento
INSERT INTO AGENDAMENTO (CPF_Paciente, Codigo_Exame, Data_Hora_Agendada, Prioridade, Status) VALUES ('11122233344', 1, TO_TIMESTAMP('2025-07-10 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Agendado');

-- 2. Realização do Exame
-- Supondo que o agendamento de código 1 foi realizado
UPDATE AGENDAMENTO SET Status = 'Realizado' WHERE Codigo = 1;
INSERT INTO REALIZACAO_EXAME (Codigo_Agendamento, CPF_Tecnico, Numero_Serie_Equipamento, Codigo_Clinica, Numero_Sala, Data_Hora_Execucao, Observacoes)
VALUES (1, '12345678900', 'RX-BR-MODELO-5000', 1, 101, TO_TIMESTAMP('2025-07-10 14:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'Paciente colaborativo, procedimento realizado sem intercorrências.');

-- 3. Laudo Técnico
-- O código do laudo é o mesmo da realização (gerado pelo IDENTITY em REALIZACAO_EXAME)
INSERT INTO LAUDO (Codigo, Data_Hora, Resultado, Status)
VALUES (1, TO_TIMESTAMP('2025-07-10 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'Não foram observadas opacidades ou anormalidades nos campos pulmonares. Estruturas ósseas da caixa torácica sem sinais de fratura.', 'Emitido');

-- 4. Diagnóstico Médico
INSERT INTO DIAGNOSTICO (Codigo_Laudo, CPF_Medico, Data_Hora, Resultado, Status)
VALUES (1, '99988877766', TO_TIMESTAMP('2025-07-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Exame de imagem do tórax dentro dos padrões da normalidade. Ausência de achados patológicos.', 'Final');

COMMIT;