-- =====================================================================
-- ARQUIVO: povoa_banco.sql
-- DESCRIÇÃO: Script para inserir dados de exemplo nas tabelas do banco.
--            Os dados são coerentes e demonstram um fluxo de uso.
-- BANCO DE DADOS: Oracle
-- =====================================================================

-- Endereços (criando primeiro para poder ser referenciado por PESSOA)
INSERT INTO ENDERECO (CEP, Rua, Numero, Bairro, Cidade) VALUES ('51020000', 'Rua das Flores', '123', 'Boa Viagem', 'Recife');
INSERT INTO ENDERECO (CEP, Rua, Numero, Bairro, Cidade) VALUES ('51030000', 'Avenida Parnamirim', '500', 'Parnamirim', 'Recife');

-- Pessoas
INSERT INTO PESSOA (CPF, Nome, Endereco_CEP, Email, Data_Nascimento, Sexo) VALUES ('11122233344', 'Carlos Santana', '51020000', 'carlos.santana@email.com', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 'M');
INSERT INTO PESSOA (CPF, Nome, Endereco_CEP, Email, Data_Nascimento, Sexo) VALUES ('55566677788', 'Ana Carolina', '51030000', 'ana.carolina@email.com', TO_DATE('1992-02-20', 'YYYY-MM-DD'), 'F');
INSERT INTO PESSOA (CPF, Nome, Endereco_CEP, Email, Data_Nascimento, Sexo) VALUES ('99988877766', 'Roberto Silva', '51020000', 'roberto.silva@email.com', TO_DATE('1978-11-30', 'YYYY-MM-DD'), 'M');
INSERT INTO PESSOA (CPF, Nome, Endereco_CEP, Email, Data_Nascimento, Sexo) VALUES ('12345678900', 'Fernanda Lima', '51030000', 'fernanda.lima@email.com', TO_DATE('1995-07-25', 'YYYY-MM-DD'), 'F');
INSERT INTO PESSOA (CPF, Nome, Endereco_CEP, Email, Data_Nascimento, Sexo) VALUES ('00987654321', 'Juliano Alves', '51020000', 'juliano.alves@email.com', TO_DATE('1988-09-10', 'YYYY-MM-DD'), 'M');
INSERT INTO PESSOA (CPF, Nome, Endereco_CEP, Email, Data_Nascimento, Sexo) VALUES ('22233344455', 'Pedro Costa', '51020000', 'pedro.costa@email.com', TO_DATE('1975-03-10', 'YYYY-MM-DD'), 'M');
INSERT INTO PESSOA (CPF, Nome, Endereco_CEP, Email, Data_Nascimento, Sexo) VALUES ('33344455566', 'Luana Melo', '51030000', 'luana.melo@email.com', TO_DATE('1980-08-22', 'YYYY-MM-DD'), 'F');
INSERT INTO PESSOA (CPF, Nome, Endereco_CEP, Email, Data_Nascimento, Sexo) VALUES ('44455566677', 'Patricia Souza', '51020000', 'patricia.souza@email.com', TO_DATE('1990-01-05', 'YYYY-MM-DD'), 'F');
INSERT INTO PESSOA (CPF, Nome, Endereco_CEP, Email, Data_Nascimento, Sexo) VALUES ('66677788899', 'Maria Oliveira', '51020000', 'maria.oliveira@email.com', TO_DATE('1960-10-01', 'YYYY-MM-DD'), 'F');
INSERT INTO PESSOA (CPF, Nome, Endereco_CEP, Email, Data_Nascimento, Sexo) VALUES ('77788899900', 'João Pereira', '51030000', 'joao.pereira@email.com', TO_DATE('1998-04-20', 'YYYY-MM-DD'), 'M');
-- Telefones
INSERT INTO PESSOA_TELEFONE(CPF, Telefone) VALUES ('11122233344', '81999887766');
INSERT INTO PESSOA_TELEFONE(CPF, Telefone) VALUES ('55566677788', '11988776655');
INSERT INTO PESSOA_TELEFONE(CPF, Telefone) VALUES ('66677788899', '81999001122');
INSERT INTO PESSOA_TELEFONE(CPF, Telefone) VALUES ('77788899900', '11987654321');

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
INSERT INTO FUNCIONARIO(CPF, Matricula, Data_Admissao) VALUES ('22233344455', 'F004', TO_DATE('2005-06-01', 'YYYY-MM-DD')); -- Pedro Costa(será médico)
INSERT INTO FUNCIONARIO(CPF, Matricula, Data_Admissao) VALUES ('33344455566', 'F005', TO_DATE('2015-09-20', 'YYYY-MM-DD')); -- Luana Melo(será médica)
INSERT INTO FUNCIONARIO(CPF, Matricula, Data_Admissao) VALUES ('44455566677', 'F006', TO_DATE('2019-04-18', 'YYYY-MM-DD')); -- Patricia Souza(será técnica)

-- Especializações (Médico e Técnico)
INSERT INTO MEDICO(CPF, CRM) VALUES ('99988877766', 'CRM-PE 12345');
INSERT INTO TECNICO(CPF, Registro_Tecnico) VALUES ('12345678900', 'CRTR-PE 6789');
INSERT INTO MEDICO(CPF, CRM) VALUES ('22233344455', 'CRM-PE 54321');
INSERT INTO MEDICO(CPF, CRM) VALUES ('33344455566', 'CRM-PE 67890');
INSERT INTO TECNICO(CPF, Registro_Tecnico) VALUES ('44455566677', 'CRTR-PE 9876');
-- Pacientes
INSERT INTO PACIENTE(CPF, Numero_Cartao) VALUES ('11122233344', 'SUS123456789');
INSERT INTO PACIENTE(CPF, Numero_Cartao) VALUES ('55566677788', 'PLANO987654321');
INSERT INTO PACIENTE(CPF, Numero_Cartao) VALUES ('66677788899', 'UNIMED-XYZ789');
INSERT INTO PACIENTE(CPF, Numero_Cartao) VALUES ('77788899900', 'AMIL-ABC123');
-- Especialidades e Exames (tabelas de domínio)
INSERT INTO ESPECIALIDADE (Nome) VALUES ('Cardiologia');
INSERT INTO ESPECIALIDADE (Nome) VALUES ('Radiologia');
INSERT INTO MEDICO_ESPECIALIDADE(CPF_Medico, Codigo_Especialidade, Data_Obtencao) VALUES ('99988877766', 2, TO_DATE('2012-05-20', 'YYYY-MM-DD')); -- Dr. Roberto é Radiologista
INSERT INTO MEDICO_ESPECIALIDADE(CPF_Medico, Codigo_Especialidade, Data_Obtencao) VALUES ('33344455566', 1, TO_DATE('2018-01-15', 'YYYY-MM-DD')); -- Dra. Luana  é Cardiologista

INSERT INTO EXAME (Nome, Tipo) VALUES ('Raio-X do Tórax', 'Imagem');
INSERT INTO EXAME (Nome, Tipo) VALUES ('Tomografia Computadorizada', 'Imagem');
INSERT INTO EXAME (Nome, Tipo) VALUES ('Ultrassonografia Abdominal', 'Imagem');

-- Equipamentos e Alocação
INSERT INTO EQUIPAMENTO(Numero_Serie, Tipo_Equipamento) VALUES ('RX-BR-MODELO-5000', 'Raio-X');
INSERT INTO EQUIPAMENTO(Numero_Serie, Tipo_Equipamento) VALUES ('ULTRA-GE-PRO', 'Ultrassom');
INSERT INTO EQUIPAMENTO(Numero_Serie, Tipo_Equipamento) VALUES ('TOMO-SIEMENS-XYZ', 'Tomógrafo');
INSERT INTO ALOCACAO_EQUIPAMENTO(Numero_Serie_Equipamento, Codigo_Clinica, Numero_Sala, Data_Hora_Inicio) VALUES ('RX-BR-MODELO-5000', 1, 101, TO_TIMESTAMP('2025-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALOCACAO_EQUIPAMENTO(Numero_Serie_Equipamento, Codigo_Clinica, Numero_Sala, Data_Hora_Inicio) VALUES ('ULTRA-GE-PRO', 2, 201, TO_TIMESTAMP('2025-01-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
-- FLUXO COMPLETO: AGENDAMENTO -> REALIZAÇÃO -> LAUDO -> DIAGNÓSTICO
-- 1. Agendamento
INSERT INTO AGENDAMENTO (CPF_Paciente, Codigo_Exame, Data_Hora_Agendada, Prioridade, Status) VALUES ('11122233344', 1, TO_TIMESTAMP('2025-07-10 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Agendado');
INSERT INTO AGENDAMENTO (CPF_Paciente, Codigo_Exame, Data_Hora_Agendada, Prioridade, Status)
VALUES ('55566677788', 2, TO_TIMESTAMP('2025-07-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Urgente', 'Agendado');
INSERT INTO AGENDAMENTO (CPF_Paciente, Codigo_Exame, Data_Hora_Agendada, Prioridade, Status)
VALUES ('66677788899', 3, TO_TIMESTAMP('2025-07-28 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Normal', 'Agendado');
INSERT INTO AGENDAMENTO (CPF_Paciente, Codigo_Exame, Data_Hora_Agendada, Prioridade, Status)
VALUES ('77788899900', 1, TO_TIMESTAMP('2025-07-30 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Urgente', 'Agendado');
-- 2. Realização do Exame
-- Supondo que o agendamento de código 1 foi realizado
UPDATE AGENDAMENTO SET Status = 'Realizado' WHERE Codigo = 1;
INSERT INTO REALIZACAO_EXAME (Codigo_Agendamento, CPF_Tecnico, Numero_Serie_Equipamento, Codigo_Clinica, Numero_Sala, Data_Hora_Execucao, Observacoes)
VALUES (1, '12345678900', 'RX-BR-MODELO-5000', 1, 101, TO_TIMESTAMP('2025-07-10 14:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'Paciente colaborativo, procedimento realizado sem intercorrências.');
UPDATE AGENDAMENTO SET Status = 'Realizado' WHERE Codigo = 2;
INSERT INTO REALIZACAO_EXAME (Codigo_Agendamento, CPF_Tecnico, Numero_Serie_Equipamento, Codigo_Clinica, Numero_Sala, Data_Hora_Execucao, Observacoes)
VALUES (2, '44455566677', 'TOMO-SIEMENS-XYZ', 1, 102, TO_TIMESTAMP('2025-07-15 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Procedimento conforme o esperado, paciente apresentou leve claustrofobia inicial.');
UPDATE AGENDAMENTO SET Status = 'Realizado' WHERE Codigo = 3;
INSERT INTO REALIZACAO_EXAME (Codigo_Agendamento, CPF_Tecnico, Numero_Serie_Equipamento, Codigo_Clinica, Numero_Sala, Data_Hora_Execucao, Observacoes)
VALUES (3, '44455566677', 'ULTRA-GE-PRO', 2, 201, TO_TIMESTAMP('2025-07-28 09:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'Paciente bem posicionada. Exame realizado sem intercorrências.');
UPDATE AGENDAMENTO SET Status = 'Realizado' WHERE Codigo = 4;
INSERT INTO REALIZACAO_EXAME (Codigo_Agendamento, CPF_Tecnico, Numero_Serie_Equipamento, Codigo_Clinica, Numero_Sala, Data_Hora_Execucao, Observacoes)
VALUES (4, '12345678900', 'RX-BR-MODELO-5000', 1, 101, TO_TIMESTAMP('2025-07-30 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'Paciente jovem, colaborativo. Exame de rotina.');

-- 3. Laudo Técnico
-- O código do laudo é o mesmo da realização (gerado pelo IDENTITY em REALIZACAO_EXAME)
INSERT INTO LAUDO (Codigo, Data_Hora, Resultado, Status)
VALUES (1, TO_TIMESTAMP('2025-07-10 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'Não foram observadas opacidades ou anormalidades nos campos pulmonares. Estruturas ósseas da caixa torácica sem sinais de fratura.', 'Emitido');
INSERT INTO LAUDO (Codigo, Data_Hora, Resultado, Status)
VALUES (2, TO_TIMESTAMP('2025-07-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Tomografia de crânio: Pequena lesão isquêmica em lobo frontal direito, sem sinais de sangramento agudo.', 'Em análise');
INSERT INTO LAUDO (Codigo, Data_Hora, Resultado, Status)
VALUES (3, TO_TIMESTAMP('2025-07-28 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Ultrassonografia abdominal sem alterações significativas. Fígado, vesícula biliar, pâncreas e baço com ecotextura e dimensões normais. Rins com boa diferenciação cortiço-medular.', 'Emitido');
INSERT INTO LAUDO (Codigo, Data_Hora, Resultado, Status)
VALUES (4, TO_TIMESTAMP('2025-07-30 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Campos pulmonares transparentes, seios costofrênicos livres. Área cardíaca de dimensões normais. Não há evidências de infiltrados ou derrames pleurais.', 'Emitido');
-- 4. Diagnóstico Médico
INSERT INTO DIAGNOSTICO (Codigo_Laudo, CPF_Medico, Data_Hora, Resultado, Status)
VALUES (1, '99988877766', TO_TIMESTAMP('2025-07-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Exame de imagem do tórax dentro dos padrões da normalidade. Ausência de achados patológicos.', 'Final');
INSERT INTO DIAGNOSTICO (Codigo_Laudo, CPF_Medico, Data_Hora, Resultado, Status)
VALUES (2, '99988877766', TO_TIMESTAMP('2025-07-16 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Achado incidental de lesão isquêmica crônica, sem repercussão clínica aparente. Sugiro acompanhamento neurológico.', 'Final');
INSERT INTO DIAGNOSTICO (Codigo_Laudo, CPF_Medico, Data_Hora, Resultado, Status)
VALUES (3, '22233344455', TO_TIMESTAMP('2025-07-29 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Exame de ultrassom abdominal dentro dos limites da normalidade. Sem indicação de patologias agudas ou crônicas.', 'Final');
INSERT INTO DIAGNOSTICO (Codigo_Laudo, CPF_Medico, Data_Hora, Resultado, Status)
VALUES (4, '33344455566', TO_TIMESTAMP('2025-07-31 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Radiografia de tórax sem alterações. Achados dentro da normalidade para a idade do paciente.', 'Final');
COMMIT;
