INSERT INTO ActivityType (ActivityTypeId, ActivityTypeAttribute)
VALUES (1, 'Program'), (2, 'Sub Program'), (3, 'Project'), (4, 'Contract'), (5, 'Point');

INSERT INTO Area (AreaId, AreaAttribute)
VALUES (1, 'Area 1'), (2, 'Area 2');

INSERT INTO Activity (ActivityId, ParentId, ActivityTypeId)
VALUES (1, NULL, 1), (2, 1, 2), (3, 2, 3), (4, 3, 4), (5, 3, 5);

INSERT INTO Program (ProgramId, ProgramAttribute)
VALUES (1, 'Program 1');

INSERT INTO SubProgram (SubProgramId, SubProgramAttribute)
VALUES (2, 'Sub Program 2');

INSERT INTO Project (ProjectId, ProjectAttribute)
VALUES (3, 'Project 3');

INSERT INTO Contract (ContractId, ContractAttribute, AreaId)
VALUES (4, 'Contract 4', 1);

INSERT INTO Point (PointId, PointAttribute)
VALUES (5, 'Point 5');
