CREATE DATABASE audioVisual;

USE AudioVisual;

CREATE TABLE project(

  idProject AUTO_INCREMENT PRIMARY KEY;;
  title VARCHAR(50) NOT NULL UNIQUE;
  startDate DATE NOT NULL;
  # Definir formato de fechas
  endDate DATE NOT NULL;
  # Definir formato de fechas
  contentCreatorDocument VARCHAR(50);
  writerDocument VARCHAR(50);
  announcerAudio VARCHAR(50);
  editorVideo VARCHAR(50);
  stageCC TINYINT DEFAULT 0;
  stageWD TINYINT DEFAULT 0;
  stageAA TINYINT DEFAULT 0;
  stageEV TINYINT DEFAULT 0;
  #idColaborador

)

CREATE TABLE imagesProject(
  id AUTO_INCREMENT PRIMARY KEY;
  idProject  FOREIGN KEY REFERENCES (project.idProject);
  imageName VARCHAR(50);

)

CREATE TABLE annotationsProject(
  id AUTO_INCREMENT PRIMARY KEY;
  idProject FOREIGN KEY REFERENCES (project.idProject);
  annotation VARCHAR(400);
)

CREATE TABLE collaborator(
  idCollaborator AUTO_INCREMENT PRIMARY KEY;
  firstName VARCHAR(25) NOT NULL;
  secondName VARCHAR(25) NULL;
  firstLastName VARCHAR(25) NOT NULL;
  secondLastName VARCHAR(25) NOT NULL;
  email VARCHAR(255) NOT NULL;
  price FLOAT DEFAULT 0

)

CREATE TABLE assignedProject(
  idCollaborator FOREIGN KEY REFERENCES (collaborator.idCollaborator);
  idProject FOREIGN KEY REFERENCES (project.idProject);
  currentlyDevelopment TINYINT(1) DEFAULT 0;
  PRIMARY KEY (idCollaborator, idProject)

)

CREATE TABLE annotationsCollaborator(
  id AUTO_INCREMENT PRIMARY KEY;
  idCollaborator FOREIGN KEY REFERENCES (collaborator.idCollaborator);
  annotation VARCHAR(400);
)
