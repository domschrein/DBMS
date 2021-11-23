-- TABLE
CREATE TABLE "Author"(
  "aid" INTEGER PRIMARY KEY NOT NULL,
  "name" varchar(255) NOT NULL,
  "email" varchar(255) NOT NULL,
  "title" VARCHAR(255) NOT NULL,
  "publishinghouse" VARCHAR(255) NOT NULL,
  "titlespublished" INTEGER NOT NULL,
  "inventory" INTEGER NOT NULL
  
);
CREATE TABLE "Author_Audits"(
  "aid" INTEGER NOT NULL,
  "TRIGGER_AuthorAudits" NOT NULL,
  "entry_date" TEXT NOT NULL
);
CREATE TABLE Author_Audits_temp (aid INT NOT NULL, name varchar(255) NOT NULL, email varchar(255) NOT NULL, title VARCHAR(255) NOT NULL, publishinghouse VARCHAR(255) NOT NULL, titlespublished INTEGER NOT NULL, inventory INTEGER NOT NULL, entry_date TEXT NOT NULL);
CREATE TABLE Certifications(
  cid INTEGER NOT NULL,
  cert_title VARCHAR(50) NOT NULL,
  CHECK (cert_title IN('PMP','CBAP','CSM','CSTE', 'CAP'))
  PRIMARY KEY(cid)
);
CREATE TABLE Course(
  course_number varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  lenghtInDays INTEGER NOT NULL,
  CONSTRAINT course_constraint UNIQUE(title),
  PRIMARY KEY(course_number)
);
CREATE TABLE CourseTopic(
  course_code varchar(255),
  topic_code INTEGER,
  FOREIGN KEY(course_code) REFERENCES Course(course_number) ON DELETE SET NULL
  FOREIGN KEY(topic_code) REFERENCES Topic(tid) ON DELETE SET NULL
  
);
CREATE TABLE Topic(
  tid INTEGER NOT NULL,
  title varchar(255) NOT NULL,
  lengthInHrs INTEGER,
  subject varchar(255),
  aid INTEGER,
  PRIMARY KEY (tid),
  FOREIGN KEY(aid) REFERENCES Author(aid) ON DELETE SET NULL,
  FOREIGN KEY(subject) REFERENCES Subject(sub_id) ON DELETE CASCADE
  CONSTRAINT subject_constraint UNIQUE(subject, title)
);
 
-- INDEX
 
-- TRIGGER
CREATE TRIGGER delete_log AFTER DELETE

ON "Author"

BEGIN

   INSERT INTO "Author_Audits"("aid", "entry_date", "TRIGGER_AuthorAudits") VALUES (new.aid, datetime('now'), 'DELETE');

END;
CREATE TRIGGER update_log AFTER UPDATE

ON "Author"

BEGIN

  INSERT INTO "Author_Audits"("aid", "entry_date", "TRIGGER_AuthorAudits") VALUES (new.aid, datetime('now'), 'UPDATE');

END;
 
-- VIEW
 
