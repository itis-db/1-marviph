CREATE TABLE Activity (
  ActivityId INT PRIMARY KEY,
  ParentId INT,
  ActivityTypeId INT,
  FOREIGN KEY (ActivityTypeId) REFERENCES ActivityType(ActivityTypeId)
);

CREATE TABLE Program (
  ProgramId INT PRIMARY KEY,
  ProgramAttribute VARCHAR(255),
  FOREIGN KEY (ProgramId) REFERENCES Activity(ActivityId)
);

CREATE TABLE SubProgram (
  SubProgramId INT PRIMARY KEY,
  SubProgramAttribute VARCHAR(255),
  FOREIGN KEY (SubProgramId) REFERENCES Activity(ActivityId)
);

CREATE TABLE Project (
  ProjectId INT PRIMARY KEY,
  ProjectAttribute VARCHAR(255),
  FOREIGN KEY (ProjectId) REFERENCES Activity(ActivityId)
);

CREATE TABLE Contract (
  ContractId INT PRIMARY KEY,
  ContractAttribute VARCHAR(255),
  AreaId INT,
  FOREIGN KEY (ContractId) REFERENCES Activity(ActivityId),
  FOREIGN KEY (AreaId) REFERENCES Area(AreaId)
);

CREATE TABLE Point (
  PointId INT PRIMARY KEY,
  PointAttribute VARCHAR(255),
  FOREIGN KEY (PointId) REFERENCES Activity(ActivityId)
);

CREATE TABLE Area (
  AreaId INT PRIMARY KEY,
  AreaAttribute VARCHAR(255)
);

CREATE TABLE ActivityType (
  ActivityTypeId INT PRIMARY KEY,
  ActivityTypeAttribute VARCHAR(255)
);
