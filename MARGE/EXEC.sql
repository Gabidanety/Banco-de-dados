USE bdTurmaNova;

MERGE tbTerceiro dest 
	USING (
		SELECT Rm,nome,status FROM tb2A WHERE status = 'APROVADO'
	) ori

		ON dest.RmTerceiro = ori.Rm
			WHEN NOT MATCHED THEN
					
			INSERT (RmTerceiro, nomeTerceiro, statusTerceiro)
				VALUES (ori.Rm, ori.nome, ori.status);		
				
					
		
MERGE tbTerceiro dest 
	USING (
		SELECT Rm,nome,status FROM tb2B WHERE status = 'APROVADO'
	) ori

		ON dest.RmTerceiro = ori.Rm
			WHEN NOT MATCHED THEN
					
			INSERT (RmTerceiro, nomeTerceiro, statusTerceiro)
				VALUES (ori.Rm, ori.nome, ori.status);			
		
SELECT * FROM tbTerceiro
				
