UPDATE PACIENTE p SET p.NOME = 'Laila',
					  p.PESO = 10,
					  p.IDADE = 12
WHERE p.ID_PACIENTE  = 2

/* 1 - Atualize o peso do paciente com ID 1 para 8.5 kg. */

UPDATE PACIENTE p SET p.PESO = 8.5
WHERE p.ID_PACIENTE  = 1


/* 2 - Atualize o estoque do medicamento com ID 3 para 50 unidades. */

UPDATE MEDICAMENTOS m SET m.ESTOQUE = 50
WHERE m.ID_MEDICAMENTO  = 3

/* 3 - Atualize a data de nascimento do tutor com ID 2 para '15/05/2001'. */

UPDATE TUTOR t SET t.DATA_NASCIMENTO = '2001-05-15'
WHERE t.ID_TUTOR  = 2


/* 4 - Atualize o motivo da consulta com ID 5 para 'Dor de barriga severa'. */

UPDATE AGENDAMENTO a SET a.MOTIVO = 'Dor de barriga severa'
WHERE a.ID_AGENDAMENTO  = 5


/* 5 - Atualize a descrição do medicamento com ID 6 para 'Anti-inflamatório para articulações'. */

UPDATE MEDICAMENTOS m SET m.DESCRICAO = 'Anti-Inflamatório para articulações'
WHERE m.ID_MEDICAMENTO  = 6


/* 6 - Atualize o nome do tutor com ID 3 para 'Maria Oliveira'. */

UPDATE TUTOR t SET t.NOME = 'Maria Oliveira'
WHERE t.ID_TUTOR  = 3


/* 7 - Atualize a descrição do medicamento com ID 2 
 para 'Aplicar no olho afetado a cada 4 horas'. */

UPDATE MEDICAMENTOS m SET m.DESCRICAO = 'Aplicar no olho afetado a cada 4 horas'
WHERE m.ID_MEDICAMENTO  = 2


/* 8 - Atualize o endereço do tutor com ID 4 para 'Rua dos Girassóis, 123'. */

UPDATE TUTOR t SET t.ENDERECO = 'Rua dos Girassóis, 123'
WHERE t.ID_TUTOR  = 4


/* 9 - Delete a consulta com ID 7. */

DELETE FROM AGENDAMENTO a WHERE a.id_agendamento = 7



/* 10 - Delete o medicamento com ID 8. */

DELETE FROM MEDICAMENTOS m WHERE m.id_medicamento = 8


/* 11 - Delete os animais do tutor que tem o ID 5. */

DELETE FROM PACIENTE p WHERE p.id_tutor = 5 

DELETE FROM AGENDAMENTO a WHERE a.id_paciente IN (SELECT p.id_paciente FROM PACIENTE p 
WHERE p.ID_TUTOR = 5)


SELECT * FROM AGENDAMENTO a WHERE a.id_paciente IN (SELECT p.id_paciente FROM PACIENTE p 
WHERE p.ID_TUTOR = 5)

SELECT * FROM PACIENTE p 
WHERE p.ID_TUTOR = 5

SELECT * FROM AGENDAMENTO a 

DELETE FROM RECEITA r WHERE r.id_agendamento = (SELECT a.ID_AGENDAMENTO 
FROM AGENDAMENTO a WHERE a.id_paciente IN (SELECT p.id_paciente FROM PACIENTE p 
WHERE p.ID_TUTOR = 5))



/* 12 - Delete todas a receitas e seu itens que não estão relacionadas a nenhuma consulta. */

DELETE FROM ITENSRECEITA i WHERE ID_RECEITA IN (SELECT id_agendamento 
												FROM AGENDAMENTO 
												WHERE id_agendamento = 0)
												
DELETE FROM RECEITA i WHERE i.ID_AGENDAMENTO NOT IN (SELECT i.id_agendamento
													FROM AGENDAMENTO 
													WHERE id_agendamento = ID_AGENDAMENTO)

