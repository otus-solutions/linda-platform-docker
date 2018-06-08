
/* Tabela temporária necessária para que o Hibernate rode funções de configuração, através de comandos INSERT, pois não funcionam chamadas de função com SELECT ou PERFORM */
CREATE TABLE temp_setup (running_date timestamp without time zone, script_name text, affected_rows int);


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Configura tabelas para usar sequências
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Configura todas as tabelas que possuem chave estrangeira para activity (entidades que são subclasses de SurveyActivity) dos esquemas coorte e lab para usarem a sequência survey_activity_seq na sua chave primária */
CREATE OR REPLACE FUNCTION setup_activities_sequences() RETURNS INTEGER AS $$ DECLARE sql_script TEXT; affected_rows INTEGER; BEGIN affected_rows := 0; FOR sql_script IN SELECT 'ALTER TABLE ' || tc.table_schema || '.' || tc.table_name || ' ALTER COLUMN id SET DEFAULT nextval(''survey_activity_seq''::regclass);' FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE tc.table_schema IN ('coorte','lab') /* Lista de esquemas que contém as tabelas de entidades que são subclasses de SurveyActivity */ AND tc.constraint_type = 'FOREIGN KEY' AND ccu.table_name = 'activity' AND ccu.column_name = 'id' ORDER BY tc.table_schema, tc.table_name LOOP RAISE NOTICE '%', sql_script; EXECUTE sql_script; affected_rows := affected_rows + 1; END LOOP; RETURN affected_rows; END; $$ LANGUAGE 'plpgsql';

/* Configura todas as tabelas para as quais existe uma sequência (cujo nome é "<nome_tabela>_seq") para usarem esta sequência na sua chave primária */
CREATE OR REPLACE FUNCTION setup_table_sequences() RETURNS INTEGER AS $$ DECLARE sql_script TEXT; affected_rows INTEGER; BEGIN affected_rows := 0; FOR sql_script IN SELECT 'ALTER TABLE ' || t.table_schema || '.' || t.table_name || ' ALTER COLUMN id SET DEFAULT nextval(''' || s.sequence_schema || '.' || s.sequence_name || '''::regclass);' FROM information_schema.tables AS t JOIN information_schema.sequences AS s ON s.sequence_name = t.table_name || '_seq' WHERE t.table_schema NOT IN ('pg_catalog','information_schema') /* Sempre exclua da busca estes esquemas que são de tabelas de configuração do PostgreSQL !!! */ ORDER BY t.table_schema, t.table_name LOOP RAISE NOTICE '%', sql_script; EXECUTE sql_script; affected_rows := affected_rows + 1; END LOOP; RETURN affected_rows; END; $$ LANGUAGE 'plpgsql';

INSERT INTO temp_setup (running_date, script_name, affected_rows) VALUES (now(), 'setup_activities_sequences()', setup_activities_sequences());
INSERT INTO temp_setup (running_date, script_name, affected_rows) VALUES (now(), 'setup_table_sequences()', setup_table_sequences());


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insere horários de verão (uma nova entrada deve ser inserita a cada ano)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO "daylight_saving" ("begin_date", "end_date", "excluded_field_centers") VALUES ('2014-10-19 00:00:00.000', '2015-02-23 00:00:00.000', 'FORTALEZA');


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inicializa contadores de grupos de Controle de Qualidade sorteados (e tubos adicionados) para cada Centro de Investigação, por visita
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (1, 'PORTO_ALEGRE', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (1, 'FORTALEZA', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (1, 'PELOTAS', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (1, 'SAO_PAULO', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (1, 'CURITIBA', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (1, 'RIO_DE_JANEIRO', 0, 0);

INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (2, 'PORTO_ALEGRE', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (2, 'FORTALEZA', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (2, 'PELOTAS', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (2, 'SAO_PAULO', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (2, 'CURITIBA', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (2, 'RIO_DE_JANEIRO', 0, 0);

INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (3, 'PORTO_ALEGRE', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (3, 'FORTALEZA', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (3, 'PELOTAS', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (3, 'SAO_PAULO', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (3, 'CURITIBA', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (3, 'RIO_DE_JANEIRO', 0, 0);

INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (4, 'PORTO_ALEGRE', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (4, 'FORTALEZA', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (4, 'PELOTAS', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (4, 'SAO_PAULO', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (4, 'CURITIBA', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (4, 'RIO_DE_JANEIRO', 0, 0);

INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (5, 'PORTO_ALEGRE', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (5, 'FORTALEZA', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (5, 'PELOTAS', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (5, 'SAO_PAULO', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (5, 'CURITIBA', 0, 0);
INSERT INTO lab.field_center_qc_counter (visit, fieldcenter, counter, tube_counter) VALUES (5, 'RIO_DE_JANEIRO', 0, 0);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insere usuários
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO "user" (code, email, fieldcenter, name, password, username) VALUES ('000', 'linda@linda.com.br', 'ADM', 'Linda', md5('teste123'), 'linda');
INSERT INTO "user" (code, email, fieldcenter, name, password, username) VALUES ('200', 'lindapoa@linda.com.br', 'PORTO_ALEGRE', 'Linda Porto Alegre', md5('teste123'), 'lindapoa');
INSERT INTO "user" (code, email, fieldcenter, name, password, username) VALUES ('100', 'lindapel@linda.com.br', 'PELOTAS', 'Linda Pelotas', md5('teste123'), 'lindapel');
INSERT INTO "user" (code, email, fieldcenter, name, password, username) VALUES ('300', 'lindafor@linda.com.br', 'FORTALEZA', 'Linda Fortaleza', md5('teste123'), 'lindafor');


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Configura permissões de usuários
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Insere as permissões de um usuário dado o seu código */
CREATE OR REPLACE FUNCTION populate_one_user_permissions(user_code character varying) RETURNS VOID AS $$ DECLARE user_entry public.user%ROWTYPE; prm_grid_id integer; functionality_name character varying; common_functionalities character varying[]; admin_functionalities character varying[]; BEGIN common_functionalities := ARRAY['ACTIVITY_VIEW', 'CONTACTS_VIEW', 'PARTICIPANT_DATA_VIEW', 'COMMENTS_VIEW', 'REPORTS_VIEW', 'ADD_PARTICIPANT_VIEW']; admin_functionalities := ARRAY['RANDOMIZATION_VIEW', 'LAB_VIEW', 'USERS_VIEW', 'SELECTOR_CENTER', 'CRYOTUBE_FILTER', 'INELIGIBILITY_VIEW', 'SYSTEM_MANAGEMENT_VIEW']; FOR user_entry IN SELECT * FROM public.user WHERE code = user_code LOOP IF user_entry.fieldcenter = 'ADM' THEN INSERT INTO permission_grid(profile, user_id) VALUES ('ADMIN', user_entry.id); ELSE INSERT INTO permission_grid(profile, user_id) VALUES ('DATA_ENTRY', user_entry.id); END IF; SELECT max(id) FROM permission_grid INTO prm_grid_id; FOR functionality_name IN SELECT unnest(common_functionalities) LOOP INSERT INTO permission(functionality, type_execution, permission_grid_id) VALUES (functionality_name, 'EXECUTION', prm_grid_id); END LOOP; IF user_entry.fieldcenter = 'ADM' THEN FOR functionality_name IN SELECT unnest(admin_functionalities) LOOP INSERT INTO permission(functionality, type_execution, permission_grid_id) VALUES (functionality_name, 'EXECUTION', prm_grid_id); END LOOP; ELSE FOR functionality_name IN SELECT unnest(admin_functionalities) LOOP INSERT INTO permission(functionality, type_execution, permission_grid_id) VALUES (functionality_name, 'NOT_PREVIEW', prm_grid_id); END LOOP; END IF; END LOOP; END; $$ LANGUAGE 'plpgsql';

/* Insere as permissões de todos os usuários, chamando para cada um a função populate_one_user_permissions */
CREATE OR REPLACE FUNCTION populate_users_permissions() RETURNS INTEGER AS $$ DECLARE user_entry public.user%ROWTYPE; prm_grid_id integer; affected_rows INTEGER; BEGIN affected_rows := 0; FOR user_entry IN SELECT * FROM public.user LOOP PERFORM populate_one_user_permissions(user_entry.code); affected_rows := affected_rows + 1; END LOOP; RETURN affected_rows; END; $$ LANGUAGE 'plpgsql';

INSERT INTO temp_setup (running_date, script_name, affected_rows) VALUES (now(), 'populate_users_permissions()', populate_users_permissions());


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insere tipos de atividades
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('RECRUITMENT','SURVEY','INT','A',false,false,false,0);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('RECRUITMENT','SURVEY','TCC','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('RECRUITMENT','SURVEY','ELC','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('RECRUITMENT','SURVEY','PRT','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('RECRUITMENT','SURVEY','GST','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('RECRUITMENT','SURVEY','GST','B',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('RECRUITMENT','SURVEY','IAR','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('RECRUITMENT','SURVEY','DGC','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('RECRUITMENT','SURVEY','RGP','A',true,false,false,7);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('INITIAL_CALLS','SURVEY','LAP','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('INITIAL_CALLS','SURVEY','LAP','B',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('INITIAL_CALLS','SURVEY','IAP','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('INITIAL_CALLS','SURVEY','IAE','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('INITIAL_CALLS','SURVEY','LIU','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('INITIAL_CALLS','SURVEY','LIU','B',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('INITIAL_CALLS','SURVEY','CAP','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('INITIAL_CALLS','SURVEY','TTG','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('INITIAL_CALLS','SURVEY','EXP','A',true,false,false,7);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('CALLS_SCHEDULING','SURVEY','DMP','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('CALLS_SCHEDULING','SURVEY','LID','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('CALLS_SCHEDULING','SURVEY','AGE','A',true,false,false,3);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','LSM','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','TSM','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','ESM','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','LUA','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','TUA','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','LDA','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','TDA','A',true,false,false,7);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','TQA','A',true,false,false,11);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','LTA','A',true,false,false,8);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','TTA','A',true,false,false,9);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','LQA','A',true,false,false,10);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('FOLLOWING_CALLS','SURVEY','OUA','A',true,false,false,2);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','TCE','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','RCP','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','ANT','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','RPN','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','SAU','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','PCO','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','AFI','A',true,false,false,7);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','RDV','A',true,false,false,8);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','COA','A',true,false,false,9);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','PRD','A',true,false,false,10);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','SON','A',true,false,false,11);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','FCI','A',true,false,false,12);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','ACE','A',true,false,false,13);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','QVD','A',true,false,false,14);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','EDG','A',true,false,false,15);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','FOR','A',true,false,false,16);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','BIA','A',true,false,false,17);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','SURVEY','ALB','A',true,false,false,18);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS2','SURVEY','DSO','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS2','SURVEY','AAF','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS2','SURVEY','TCM','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS2','SURVEY','MEC','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS2','SURVEY','MEI','A',true,false,true,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS2','SURVEY','MAI','A',true,true,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS2','SURVEY','MAI','B',true,true,false,5);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','CSJ','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','ISG','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','AEJ','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','CST','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','AET','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','CSS','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','AES','A',true,false,false,7);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','CSN','A',true,false,false,8);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','AEN','A',true,false,false,9);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','CSC','A',true,false,false,10);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','AEC','A',true,false,false,11);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','BIO','A',true,false,false,12);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','DNA','A',true,false,false,13);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','TTP','A',true,false,false,14);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('BS1','LAB_FORM','EXA','A',true,false,false,15);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','RCPS','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','ANTS','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','QVDS','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','SAUS','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','AFIS','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','SONS','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','RDVS','A',true,false,false,7);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','ALBS','A',true,false,false,8);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','IMAS','A',true,false,false,9);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','EDGS','A',true,false,false,10);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','SURVEY','ALHS','A',true,false,false,11);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','CSJS','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','ISGS','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','AEJS','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','CSTS','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','AETS','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','CSSS','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','AESS','A',true,false,false,7);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','CSCS','A',true,false,false,8);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','AECS','A',true,false,false,9);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','BIOS','A',true,false,false,10);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','DNAS','A',true,false,false,11);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','TTPS','A',true,false,false,12);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('S','LAB_FORM','EXAS','A',true,false,false,13);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','RCPU','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','ANTU','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','BIAU','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','QVDU','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','SAUU','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','AFIU','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','SONU','A',true,false,false,7);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','RDVU','A',true,false,false,8);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','FBBU','A',true,false,false,9);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','FORU','A',true,false,false,10);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','AAFU','A',true,false,false,11);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','TCMU','A',true,false,false,12);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','ACEU','A',true,false,false,13);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','SURVEY','DSOU','A',true,false,false,14);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','CSJU','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','ISGU','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','AEJU','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','CSTU','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','AETU','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','CSSU','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','AESU','A',true,false,false,7);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','CSCU','A',true,false,false,8);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','AECU','A',true,false,false,9);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','BIOU','A',true,false, false,10);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','DNAU','A',true,false,false,11);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','TTPU','A',true,false,false,12);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('U','LAB_FORM','EXAU','A',true,false,false,13);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','CSJD','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','ISGD','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','AEJD','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','CSTD','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','AETD','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','CSSD','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','AESD','A',true,false,false,7);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','CSCD','A',true,false,false,8);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','AECD','A',true,false,false,9);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','BIOD','A',true,false, false,10);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','DNAD','A',true,false,false,11);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','TTPD','A',true,false,false,12);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','LAB_FORM','EXAD','A',true,false,false,13);

INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','RCPD','A',true,false,false,1);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','ANTD','A',true,false,false,2);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','BIAD','A',true,false,false,3);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','SAUD','A',true,false,false,4);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','AFID','A',true,false,false,5);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','SOND','A',true,false,false,6);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','RDVD','A',true,false,false,7);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','QVDD','A',true,false,false,8);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','HABD','A',true,false,false,9);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','FBBD','A',true,false,false,10);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','ACED','A',true,false,false,11);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','DSOD','A',true,false,false,12);
INSERT INTO "activity_type" ("activity_group","form_type","activity_shortname","version","available","intervention_group", "control_group", "activity_order") VALUES ('Two','SURVEY','TCMD','A',true,false,false,13);

/* Remove tabela temporária. Se algo der errado este comando não é executado e esta tabela permanece no banco, mostrando quais funções rodaram e quantas linhas afetaram */
DROP TABLE temp_setup;
