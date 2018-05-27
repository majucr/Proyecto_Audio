CREATE DATABASE audioVisual;

USE audioVisual;

CREATE TABLE project(

  idProject INT AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL UNIQUE,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  contentCreatorDocument VARCHAR(50),
  writerDocument VARCHAR(50),
  announcerAudio VARCHAR(50),
  editorVideo VARCHAR(50),
  stageCC TINYINT DEFAULT 0,
  stageWD TINYINT DEFAULT 0,
  stageAA TINYINT DEFAULT 0,
  stageEV TINYINT DEFAULT 0,

  PRIMARY KEY (idProject)

);

CREATE TABLE imagesProject(

  id INT AUTO_INCREMENT,
  idProject INT,
  imageName VARCHAR(50) NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (idProject) REFERENCES project(idProject)

);

CREATE TABLE annotationsProject(

  id INT AUTO_INCREMENT,
  idProject INT,
  annotation VARCHAR(400),

  PRIMARY KEY (id),
  FOREIGN KEY (idProject) REFERENCES project(idProject)
);

CREATE TABLE collaborator(

  idCollaborator INT AUTO_INCREMENT,
  userName VARCHAR(25) NOT NULL UNIQUE,
  firstName VARCHAR(25),
  secondName VARCHAR(25),
  firstLastName VARCHAR(25),
  secondLastName VARCHAR(25),
  email VARCHAR(255),
  price FLOAT DEFAULT 0,

  PRIMARY KEY (idCollaborator)

);

CREATE TABLE assignedProject(

  idCollaborator INT,
  idProject INT,
  currentlyDevelopment TINYINT(1) DEFAULT 0,
  stage CHAR(1) NOT NULL,

  PRIMARY KEY (idCollaborator, idProject),
  FOREIGN KEY (idCollaborator) REFERENCES collaborator(idCollaborator),
  FOREIGN KEY (idProject) REFERENCES project(idProject)

);

CREATE TABLE annotationsCollaborator(

  id INT AUTO_INCREMENT,
  idCollaborator INT,
  annotation VARCHAR(400),

  PRIMARY KEY (id),
  FOREIGN KEY (idCollaborator) REFERENCES collaborator(idCollaborator)

);
