CREATE TABLE public.workers (
	id serial4 NOT NULL,
	"name" varchar NULL,
	"position" varchar NULL,
	hire_date date NULL,
	salary int4 NULL,
	boss_id int4 NULL,
	CONSTRAINT workers_pkey PRIMARY KEY (id)
);

INSERT INTO public.workers ("name","position",hire_date,salary,boss_id) VALUES
	 ('suberboss1','boss1','2000-12-14',150000,0),
	 ('suberboss2','boss1','2000-12-14',150000,0),
	 ('manager3','boss2','2000-12-14',150000,2),
	 ('manager4','boss2','2000-12-14',150000,2),
	 ('manager1','boss2','2000-12-14',150000,1),
	 ('manager2','boss2','2000-12-14',150000,1),
	 ('manager3','boss3','2000-12-14',150000,3),
	 ('manager4','boss3','2000-12-14',150000,3),
	 ('manager1','boss3','2000-12-14',150000,4),
	 ('manager2','boss3','2000-12-14',150000,4);
INSERT INTO public.workers ("name","position",hire_date,salary,boss_id) VALUES
	 ('manager3','boss3','2000-12-14',150000,5),
	 ('manager4','boss3','2000-12-14',150000,5),
	 ('manager1','boss3','2000-12-14',150000,6),
	 ('manager2','boss3','2000-12-14',150000,6),
	 ('m1','boss4','2000-12-14',90000,7),
	 ('m2','boss4','2000-12-14',90000,8),
	 ('m2','boss4','2000-12-14',90000,9),
	 ('m2','boss4','2000-12-14',90000,9),
	 ('m2','boss4','2000-12-14',90000,10),
	 ('m2','boss5','2000-12-14',90000,15);
INSERT INTO public.workers ("name","position",hire_date,salary,boss_id) VALUES
	 ('m2','boss5','2000-12-14',90000,16),
	 ('m2','boss5','2000-12-14',90000,17),
	 ('m2','boss5','2000-12-14',90000,18),
	 ('m2','boss5','2000-12-14',90000,19),
	 ('m2','boss5','2000-12-14',90000,20),
	 ('m2','boss5','2000-12-14',90000,21),
	 ('m2','boss5','2000-12-14',90000,22),
	 ('m2','boss5','2000-12-14',90000,23),
	 ('m2','boss5','2000-12-14',90000,24),
	 ('m2','boss4','2000-12-14',90000,11);
INSERT INTO public.workers ("name","position",hire_date,salary,boss_id) VALUES
	 ('m2','boss4','2000-12-14',90000,12),
	 ('m2','boss4','2000-12-14',90000,13),
	 ('m2','boss4','2000-12-14',90000,14);
