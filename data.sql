INSERT INTO activitytype(activitytypeid, name, sysname)
SELECT d.*
FROM (
	VALUES(1,'Программа','Program'),
	(2,'Подпрограмма','SubProgram'),
	(3,'Территория','Area'),
	(4,'Проект','Project'),
	(5,'КТ(Проект)','Point'),
	(6,'Контракт','Contract'),
	(7,'КТ(Контракт)','Point')
) 
AS d(activitytypeid, name, sysname)
WHERE NOT EXISTS(
	SELECT 1 FROM activitytype AS t
	WHERE t.activitytypeid = d.activitytypeid
);

INSERT INTO activity(activityid, activitytypeid, code, name, parentid)
SELECT d.*
FROM (
    VALUES (1, 1, 'А', 'Программа', null),
           (2, 2, 'А1', 'Подпрограмма', 1),
           (3, 3, 'А1.1', 'Территория', 2),
           (4, 4, 'А1.1.1', 'Проект', 3),
           (5, 5, 'А1.1.1.1', 'КТ(Проект)', 4),
           (6, 6, 'А1.1.1.1.1', 'Контракт', 5),
           (7, 7, 'А1.1.1.1.1.1', 'КТ(Контракт)', 6),
           (8, 1, 'B', 'Программа', null),
           (9, 2, 'B1', 'Подпрограмма', 8),
           (10, 3, 'B1.1', 'Территория', 9),
           (11, 4, 'B1.1.1', 'Проект', 10),
           (12, 5, 'B1.1.1.1', 'КТ(Проект)', 11),
           (13, 6, 'B1.1.1.1.1', 'Контракт', 12),
           (14, 7, 'B1.1.1.1.1.1', 'КТ(Контракт)', 13),
           (15, 1, 'C', 'Программа', null),
           (16, 2, 'C1', 'Подпрограмма', 15),
           (17, 3, 'C1.1', 'Территория', 16),
           (18, 4, 'C1.1.1', 'Проект', 17),
           (19, 5, 'C1.1.1.1', 'КТ(Проект)', 18),
           (20, 6, 'C1.1.1.1.1', 'Контракт', 19),
           (21, 7, 'C1.1.1.1.1.1', 'КТ(Контракт)', 20)
) 
AS d(activityid, activitytypeid, code, name, parentid)
WHERE NOT EXISTS(
    SELECT 1 FROM activity AS t
    WHERE t.activityid = d.activityid
);

INSERT INTO program(programid, indexnum, yearstart, yearfinish)
SELECT d.*
FROM (
	VALUES(1, 0, 1972, 2000),
	(8, 1, 2000, 2049),
	(15, 2, 2010, 2089)
) 
AS d(programid, indexnum, yearstart, yearfinish)
WHERE NOT EXISTS(
	SELECT 1 FROM program t
	WHERE t.programid = d.programid
);

INSERT INTO area(areaid, name)
SELECT d.*
FROM (
    VALUES(3, 'Апастово'),
          (10, 'Каратун'),
          (17, 'Вахитовский Район')
) 
AS d(areaid, name)
WHERE NOT EXISTS(
    SELECT 1 FROM area AS t
    WHERE t.areaid = d.areaid
);

INSERT INTO subprogram(subprogramid, indexnum)
SELECT d.*
FROM (
    VALUES(2, 0),
          (9, 1),
          (16, 2)
) 
AS d(subprogramid, indexnum)
WHERE NOT EXISTS(
    SELECT 1 FROM subprogram AS t
    WHERE t.subprogramid = d.subprogramid
);

INSERT INTO project(projectid, targetdescr)
SELECT d.*
FROM (
    VALUES(4, 'Цель 1'),
          (11, 'Цель 2'),
          (18, 'Цель 3')
) 
AS d(projectid, targetdescr)
WHERE NOT EXISTS(
    SELECT 1 FROM project AS t
    WHERE t.projectid = d.projectid
);

INSERT INTO contract(contractid, areaid)
SELECT d.*
FROM (
    VALUES(6, 3),
          (13, 10),
          (20, 17)
) 
AS d(contractid, areaid)
WHERE NOT EXISTS(
    SELECT 1 FROM contract AS t
    WHERE t.contractid = d.contractid
);

INSERT INTO point(pointid, plandate, factdate)
SELECT d.*
FROM (
    VALUES(5, current_date, current_date + 10),
          (7, date '2001-02-16', date '2001-02-16' + 365),
          (12, date '2004-09-17', date '2004-09-17' - 10),
          (14, date '2020-11-11', date '2020-11-05' - 424),
          (19, date '2012-12-21', date '2012-12-21' + 10000),
          (21, date '2020-02-20', date '2020-02-20' + 11)
) 
AS d(pointid, plandate, factdate)
WHERE NOT EXISTS(
    SELECT 1 FROM point AS t
    WHERE t.pointid = d.pointid
);
