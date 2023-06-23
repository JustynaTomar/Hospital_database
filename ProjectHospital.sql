-- Creating new database and tables. Assigning Primary Key and Foreign Key constraints (I used different methods to assign PK and FK).

CREATE DATABASE hospital;
USE hospital;
CREATE TABLE Ward (
    Ward_Id INTEGER NOT NULL,
    WardName VARCHAR(55) NOT NULL,
    TypeofWard VARCHAR(55) NULL,
        CONSTRAINT PK_Ward PRIMARY KEY (Ward_Id)
);

CREATE TABLE Patients (
    Patient_Id INTEGER NOT NULL,
    FirstName VARCHAR(55) NOT NULL,
    Surname VARCHAR(55) NOT NULL,
    DateOfBirth DATE NULL,
    Gender VARCHAR(1) NULL,
      CONSTRAINT PK_Patient_Id PRIMARY KEY (Patient_Id)
);

CREATE TABLE Doctors (
    Doctor_Id INTEGER NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL
    );

CREATE TABLE Diagnosis (
    Diagnosis_Id VARCHAR(10) NOT NULL PRIMARY KEY,
    DiagnosisName VARCHAR(55) NOT NULL
    );

CREATE TABLE TreatmentEpisode (
    Treatment_Id INTEGER NOT NULL PRIMARY KEY,
    Patient_Id INTEGER NOT NULL,
    Consultant_Id INTEGER NOT NULL,
    Ward_Id INTEGER NOT NULL,
    AdmissionDate DATE NOT NULL,
    DischargeDate DATE NULL,
    Diagnosis_Id VARCHAR(10) NULL
);
ALTER TABLE TreatmentEpisode
    ADD CONSTRAINT FK_Patient_Id 
FOREIGN KEY(Patient_Id)
REFERENCES Patients(Patient_Id);

ALTER TABLE TreatmentEpisode
    ADD CONSTRAINT FK_Consultant_Id 
FOREIGN KEY(Consultant_Id)
REFERENCES Doctors(Doctor_Id);

ALTER TABLE TreatmentEpisode
    ADD CONSTRAINT FK_Ward_Id 
FOREIGN KEY(Ward_Id)
REFERENCES Ward(Ward_Id);

ALTER TABLE TreatmentEpisode
    ADD CONSTRAINT FK_Diagnosis_Id 
FOREIGN KEY(Diagnosis_Id)
REFERENCES Diagnosis(Diagnosis_Id);


CREATE TABLE ContactDetails (
    Contact_Id INTEGER NOT NULL PRIMARY KEY,
    Patient_Id INTEGER NOT NULL,
    StreetNumber VARCHAR(10) NULL,
    StreetName VARCHAR(55) NULL,
    PostCode VARCHAR(8) NULL,
    City VARCHAR(30) NULL,
    PhoneNumber VARCHAR(11) NULL
    );
    
ALTER TABLE ContactDetails
    ADD CONSTRAINT FK_Patient_Id2 
    FOREIGN KEY (Patient_Id) 
    REFERENCES Patients(Patient_Id);
    
CREATE TABLE Medication (
    Medication_Id INTEGER NOT NULL PRIMARY KEY,
    GenericName VARCHAR(50) NOT NULL,
    BrandName VARCHAR(50) NOT NULL,
    Description VARCHAR(55) NULL
);

CREATE TABLE Prescription (
    Prescription_Id INTEGER NOT NULL PRIMARY KEY,
    Patient_Id INTEGER NOT NULL,
    Medication_Id INTEGER NOT NULL,
    Doctor_Id INTEGER NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    FOREIGN KEY (Medication_Id) REFERENCES Medication(Medication_Id),
    FOREIGN KEY (Doctor_Id) REFERENCES Doctors(Doctor_Id),
    FOREIGN KEY (Patient_Id) REFERENCES Patients(Patient_Id)
);

-- INSERTING VALUES INTO TABLES
INSERT INTO  Ward
(Ward_Id, WardName, TypeofWard) 
    VALUES 
    (1, 'Blackford', 'Intensive Psychiatric Care Unit'),
    (2, 'Craiglockhart', 'Female Acute Admissions'),
    (3, 'Meadows', 'Female Acute Admissions'),
    (4, 'Balcarres', 'Male Acute Admissions'),
    (5, 'Merchiston', 'Male Acute Admissions'),
    (6, 'Hermitage', 'Mixed Acute Admissions'),
    (7, 'Redwood', 'Forensic Acute Admissions'),
    (8, 'Harlow', 'Older Age Functional'),
    (9, 'Robert Fergusson Unit', 'neurorehabilitation'),
    (10, 'The Ritson Clinic', 'detoxification');
    
INSERT INTO Patients
(Patient_Id, FirstName, Surname, DateOfBirth, Gender)
    VALUES 
    (9567, 'John', 'Roberts', '1977-08-19', 'M'),
    (9216, 'Maria', 'Walsh', '1992-07-12', 'F'),
    (6518, 'Willow', 'Kerr', '1998-12-31', 'F'),
    (7498, 'Eliza', 'Flynn', '1966-03-06', 'F'),
    (4231, 'Christopher', 'MacDonald', '1954-01-23', 'M'),
    (7497, 'Aliya', 'Iqbal', '1988-06-05', 'F'),
    (4587, 'Mark', 'Harrison', '1984-11-16', 'M'),
    (3226, 'Amanda', 'Twain', '1986-08-07', 'F'),
    (9345, 'Heath', 'Sandoval', '1991-10-02', 'M'),
    (6529, 'Meadow', 'Green', '1978-02-19', 'F'),
    (2294, 'Ivy', 'Shelton', '1955-05-15', 'F'),
    (1276, 'Roger', 'Ferguson', '1969-09-12', 'M'),
    (5543, 'Todd', 'Kemp', '1985-04-09', 'M'),
    (8732, 'Marlene', 'McGregor', '1974-03-30', 'F'),
    (1128, 'Titus', 'Hayden', '1989-07-26', 'M'),
    (8749, 'Daisy', 'Cherry', '1996-03-13', 'F'),
    (0745, 'Diana', 'Morris', '1966-09-29', 'F'),
    (4675, 'Graham', 'Brown', '1975-01-08', 'M'),
    (1354, 'Ellis', 'Nguyen', '1987-03-25', 'M'),
    (9851, 'Lucy', 'Fisher', '1994-12-28', 'F'),
    (5897, 'Terrence', 'Preston', '1961-10-31', 'M'),
    (2143, 'Anna', 'Moyer', '1948-08-17', 'F'),
    (6742, 'Frederick', 'Wilkerson', '1952-06-14', 'M'),
    (1965, 'Jayden', 'Jones', '1976-09-18', 'M'),
    (4132, 'Logan', 'Cross', '1987-04-21', 'M');
    
INSERT INTO ContactDetails
(Contact_Id, Patient_Id, StreetNumber, StreetName, PostCode, City, PhoneNumber)
    VALUES
    (1, 9567, 18, 'North Road', 'CW24 8VF', 'Crewe', '07865993244'),
    (2, 9216, 31, 'Alexander Road', 'PE37 2ZW', 'Peterborough', '07542272287'),
    (3, 6518, 84, 'Manchester Road', 'M52 2OF', 'Manchester', '07949510458'),
    (4, 7498, 848, 'South Street', 'L31 8CM', 'Liverpool', '07911639327'),
    (5, 4231, 20, 'Chester Road', 'IV99 5AZ', 'Inverness', '07876127585'),
    (6, 7497, 737, 'York Road', 'SE21 2TH', 'South East London', '07716211417'),
    (7, 4587, 20, 'Park Lane', 'BH57 6BV', 'Bournemouth', '07857746041'),
    (8, 3226, 6, 'The Drive', 'BT62 6OW', 'Belfast', '07756978352'),
    (9, 9345, 9083, 'Springfield Road', 'MK80 5VY', 'Milton Keynes', '07041218734'),
    (10, 6529, 14, 'George Street', 'GL90 1WL', 'Gloucester', '07811160488'),
    (11, 2294, 35, 'Victoria Road', 'LU28 9ZJ', 'Luton', '07951703937'),
    (12, 1276, 14, 'West Street', 'DE82 8XS', 'Derby', '07831910595'),
    (13, 5543, 38, 'Grange Road', 'RM70 0XA', 'Romford', '07923941961'),
    (14, 8732, 50, 'Kingsway', 'BH24 2WD', 'Bournemouth', '07776765748'),
    (15, 1128, 9903, 'Chester Road', 'N54 7KR', 'North London', '07833614632'),
    (16, 8749, 21, 'Green Lane', 'WA24 8GR', 'Warrington', '07006616958'),
    (17, 0745, 9, 'Park Road', 'PL39 2EV', 'Plymouth', '07080293854'),
    (18, 4675, 27, 'Queen Street', 'KY52 1LA', 'Kirkaldy', '07877480872'),
    (19, 1354, 56, 'The Grove', 'FK46 2VN', 'Falkirk', '07079884021'),
    (20, 9851, 19, 'High Street', 'ML75 8MK', 'Motherwell', '07882587184'),
    (21, 5897, 60, 'Manchester Road', 'CT89 7KE', 'Cantenbury', '07825553743'),
    (22, 2143, 10, 'Victoria Road', 'SA22 0QO', 'Swansea', '07832220637'),
    (23, 6742, 89, 'Mill Lane', 'HA11 6EZ', 'Harrow', '07701320507'),
    (24, 1965, 51, 'South Street', 'TR51 6CW', 'Truro', '07919495186'),
    (25, 4132, 473, 'Richmond Road', 'EH44 8AQ', 'Edinburgh', '07760272346');
    
  
    
    INSERT INTO Diagnosis
    (Diagnosis_Id, DiagnosisName)
        VALUES
        ('F06.2', 'Organic delusional disorder'),
        ('F06.3', 'Organic mood disorder'),
        ('F06.7', 'Mild cognitive disorder'),
        ('F07.0', 'Organic personality disorder'),
        ('F10.01', 'Mental and behavioural disorder due to use of alcohol'),
        ('F11.01', 'Mental and behavioural disorder due to use of opioids'),
        ('F10.2', 'Alcohol dependence syndrome'),
        ('F20.0', 'Paranoid schizophrenia'),
        ('F20.1', 'Hebephrenic schizophrenia'),
        ('F20.2', 'Catatonic schizophrenia'),
        ('F20.3', 'Undifferentiated schizophrenia'),
        ('F22.0', 'Delusional disorder'),
        ('F25.0', 'Schizoaffective disorder, manic type'),
        ('F25.1', 'Schizoaffective disorder, depressive type'),
        ('F25.2', 'Schizoaffective disorder, mixed type'),
        ('F30.0', 'Hypomania'),
        ('F31.0', 'Bipolar affective disorder, current episode hypomanic'),
        ('F31.1', 'Bipolar affective disorder, current episode manic'),
        ('F31.5', 'Bipolar affective disorder, current episode depression'),
        ('F32.1', 'Moderate depressive episode'),
        ('F33.2', 'Recurrent depressive disorder, current episode severe'),
        ('F41.1', 'Generalised anxiety disorder'),
        ('F44.0', 'Dissociative amnesia'),
        ('F60.3', 'Emotionally unstable personality disorder');
        
INSERT INTO Doctors
(Doctor_Id, Firstname, Surname, Position)
    VALUES
    (101, 'Marcel', 'Crolla', 'Consulant'),
    (102, 'Catherine', 'Waldord', 'Consultant'),
    (103, 'Arabella', 'Wolf', 'Consultant'),
    (104, 'Isaac', 'Mahmood', 'Consultant'),
    (105, 'Jonathan', 'Jamieson', 'ST1 Speciality Training'),
    (106, 'Ophelia', 'Harrison', 'ST2 Speciality Training'),
    (107, 'Adam', 'Smith', 'ST2 Speciality Training'),
    (108, 'Jemima', 'ODonnell', 'ST1 Speciality Training'),
    (109, 'Anastasia', 'Novak', 'FY2 Junior doctor'),
    (110, 'Harry', 'Adams', 'FY2 Junior doctor');
    
INSERT INTO Medication
(Medication_Id, GenericName, BrandName, Description)
    VALUES
    (201, 'Flupentixol', 'Depixol', 'first generation antipsychotic'),
    (202, 'Haloperidol', 'Haldol', 'first generation antipsychotic'),
    (203, 'Zuclopenthixol', 'Clopixol', 'first generation antipsychotic'),
    (204, 'Aripiprazole', 'Abilify', 'second generation antipsychotic'),
    (205, 'Amisulpride', 'Solian', 'second generation antipsychotic'),
    (206, 'Chlorpromazine', 'Largactil', 'first generation antipsychotic'),
    (207, 'Olanzapine', 'Zyprexa', 'second generation antipsychotic'),
    (208, 'Citalopram', 'Cipramil', 'selective serotonin reuptake inhibitor'),
    (209, 'Fluoxetine', 'Prozac', 'selective serotonin reuptake inhibitor'),
    (210, 'Venlafaxine', 'Alventa XL', 'serotonin and noradrenalin reuptake inhibitor'),
    (211, 'Amitriptyline', 'Lentizol R', 'tricyclic antidepressant'),
    (212, 'Lithium', 'Priadel', 'mood stabiliser'),
    (213, 'Sodium valproate', 'Epilim Chrono', 'anticolvulsant/mood stabiliser'),
    (214, 'Lamotrigine', 'Lamictal', 'anticonvulsant/mood stabiliser');
    
INSERT INTO TreatmentEpisode
(Treatment_Id, Patient_Id, Consultant_Id, Ward_Id, AdmissionDate, DischargeDate, Diagnosis_Id)
    VALUES
    (301, 9567, 101, 4, '2023-02-22', NULL, 'F20.0'),
    (302, 9216, 102, 1, '2023-03-18', NULL, 'F25.0'),
    (303, 6518, 103, 2, '2023-01-29', '2023-03-28', 'F31.1'),
    (304, 7498, 104, 3, '2023-02-12', '2023-03-31', 'F20.0'),
    (305, 4231, 101, 8, '2022-10-08', NULL, 'F25.2'),
    (306, 7497, 101, 2, '2022-12-26', '2023-02-28', 'F60.3'),
    (307, 4587, 101, 5, '2023-02-05', '2023-03-13', 'F20.2'),
    (308, 3226, 101, 9, '2023-03-27', NULL, 'F06.2'),
    (309, 9345, 102, 10, '2023-01-15', '2023-02-22', 'F10.01'),
    (310, 6529, 102, 9, '2022-11-21', NULL, 'F06.3'),
    (311, 2294, 102, 8, '2023-01-03', '2023-03-11', 'F20.2'),
    (312, 1276, 102, 10, '2023-03-03', '2023-03-29', 'F10.2'), 
    (313, 5543, 103, 1, '2023-03-11', NULL, 'F20.0'),
    (314, 8732, 103, 2, '2023-02-05', '2023-03-17', 'F31.0'),
    (315, 1128, 103, 4, '2022-11-30', '2023-01-21', 'F31.1'),
    (316, 8749, 103, 6, '2023-01-25', '2023-03-12', 'F31.5'),
    (317, 0745, 104, 6, '2023-02-11', NULL, 'F22.0'),
    (318, 4675, 104, 7, '2023-01-02', NULL, 'F25.0'),
    (319, 1354, 104, 7, '2023-02-09', '2023-03-28', 'F22.0'),
    (320, 9851, 104, 9, '2023-01-15', '2023-03-09', 'F06.3'),
    (321, 5897, 101, 3, '2023-01-07', '2023-02-19', 'F31.0'),
    (322, 2143, 102, 8, '2023-01-30', '2023-03-27', 'F20.0'),
    (323, 6742, 103, 8, '2022-11-28', '2023-02-13', 'F22.0'),
    (324, 1965, 104, 3, '2023-03-11', NULL, 'F30.0'),
    (325, 4132, 101, 4, '2023-02-06', '2023-03-31', 'F20.0');
    
    SELECT * FROM TreatmentEpisode;
    
INSERT INTO Prescription
(Prescription_Id, Patient_Id, Medication_Id, Doctor_Id, StartDate, EndDate)
    VALUES
    (401, 9567, 201, 101, '2023-02-23', '2023-02-28'),
    (402, 9216, 202, 102, '2023-03-19', NULL),
    (403, 6518, 212, 103, '2023-02-01', '2023-03-01'),
    (404, 7498, 203, 106, '2023-03-01', '2023-03-31'),
    (405, 4231, 205, 108, '2022-10-10', '2022-12-20'),
    (406, 7497, 204, 107, '2022-12-28', '2023-01-30'),
    (407, 4587, 206, 105, '2023-02-06', NULL),
    (409, 9345, 211, 107, '2023-01-19', '2023-02-22'),
    (410, 6529, 212, 105, '2023-01-03', NULL),
    (411, 2294, 201, 109, '2023-01-06', '2023-03-11'),
    (412, 1276, 208, 110, '2023-03-04', '2023-03-29'),
    (413, 5543, 203, 102, '2023-03-11', NULL),
    (414, 8732, 213, 103, '2023-02-06', '2023-03-09'),
    (415, 1128, 212, 108, '2023-12-01', '2023-01-23'),
    (416, 8749, 214, 107, '2023-01-26', '2023-03-01'),
    (417, 0745, 207, 105, '2023-02-13', NULL),
    (418, 4675, 202, 106, '2023-01-25', '2023-02-12'),
    (419, 1354, 205, 103, '2023-02-10', '2023-03-28'),
    (420, 4132, 206, 108, '2023-02-06', '2023-02-28');
    

-- Using any type of the joins create a view that combines multiple tables in a logical way
-- Created a view combining data from 6 different tables to show important information about each patient and their treatment.
CREATE VIEW vw_PatientDiagnosisDoctorMedication
AS 
    SELECT p.Patient_Id, CONCAT(p.FirstName, ' ', p.Surname) AS PatientsName, d.DiagnosisName, CONCAT(dr.FirstName, ' ', dr.Surname) AS ConsultantsName, m.GenericName AS Medication
    FROM Patients p
        LEFT JOIN TreatmentEpisode t
            ON t.Patient_Id = p.Patient_Id
        LEFT JOIN Diagnosis d
            ON t.Diagnosis_Id = d.Diagnosis_Id
        LEFT JOIN Doctors dr
            ON t.Consultant_Id = dr.Doctor_Id
        LEFT JOIN Prescription pr
            ON p.Patient_Id = pr.Patient_Id
        LEFT JOIN Medication m
            ON pr.Medication_Id = m.Medication_Id;
    
SELECT * FROM vw_PatientDiagnosisDoctorMedication;

-- In your database, create a stored function that can be applied to a query in your DB
-- Function to determine whether a patient is currently in the hospital or has been discharged

DELIMITER //
CREATE FUNCTION Patient_status(DischargeDate DATE)
RETURNS varchar(50)
DETERMINISTIC
BEGIN
	DECLARE Patient_status varchar(50);
    IF DischargeDate IS NULL THEN
		SET Patient_status = "Not discharged";
	ELSE 
		SET Patient_status = "Discharged";
    END IF;
    RETURN (Patient_status);
END//
DELIMITER ;

select p.firstname, p.Surname, Patient_status (t.DischargeDate)
from Patients p
    LEFT JOIN TreatmentEpisode t
        ON p.Patient_Id = t.Patient_Id
        ORDER BY t.DischargeDate;
        
-- Prepare an example query with a subquery to demonstrate how
-- to extract data from your DB for analysis

-- Subquery to find data for patients with any schizophrenia diagnosis and their days of treatment

SELECT 
    t.Patient_Id, t.Diagnosis_Id, DATEDIFF(t.DischargeDate, t.AdmissionDate) AS DaysOfTreatment
FROM
    TreatmentEpisode t
WHERE
    t.Diagnosis_Id IN (SELECT 
        d.Diagnosis_Id
        FROM
            Diagnosis d
        WHERE
            d.DiagnosisName LIKE '%schizophrenia%');
            
   
            
-- Subquery to find all patient who have been prescribed first generation antipsychotic (and their diagnosis)
SELECT 
    pr.Patient_Id, pr.Medication_Id
FROM
    Prescription pr
WHERE
    pr.Medication_Id IN (SELECT 
            m.Medication_Id
        FROM
            Medication m
        WHERE
            m.Description = 'first generation antipsychotic');
  
  -- Create DB diagram where all table relations are shown (shown separately)
  
  -- In your database, create a stored procedure and demonstrate how it runs
  -- Stored procedure to show all patients without prescription

DELIMITER //
    CREATE PROCEDURE PatientsWithoutPrescription()
        BEGIN
            SELECT p.Patient_Id, pr.Prescription_Id
            FROM Patients p
                LEFT JOIN Prescription pr
                    ON p.Patient_Id = pr.Patient_Id
                    WHERE 
                    pr.Patient_Id IS NULL;
        END //
DELIMITER ;
CALL PatientsWithoutPrescription;


-- Create trigger preventing from inserting data where admission date is older than discharge date
delimiter // 
CREATE TRIGGER AdmissionCheck 
    BEFORE INSERT ON TreatmentEpisode
    FOR EACH ROW 
    BEGIN
        IF NEW.AdmissionDate > NEW.DischargeDate
        THEN SET NEW.AdmissionDate = NULL;
        END IF;
    END// 
delimiter ;
-- Testing trigger by inserting data with admission date after discharge date.
 INSERT INTO TreatmentEpisode
 (Treatment_Id, Patient_Id, Consultant_Id, Ward_Id, AdmissionDate, DischargeDate)
    VALUES 
(987, 9999, 101, 4, '2023-03-30', '2023-03-29');
-- Inserting valid data:
INSERT INTO TreatmentEpisode
(Treatment_Id, Patient_Id, Consultant_Id, Ward_Id, AdmissionDate, DischargeDate)
   VALUES 
    (987, 9999, 101, 4, '2023-03-28', '2023-03-29');
    
DELETE FROM TreatmentEpisode
WHERE Treatment_Id = 987;
    

    
-- Create a view that uses at least 3-4 base tables; prepare and demonstrate a query 
-- that uses the view to produce a logically arranged result set for analysis.
-- Created a view consisting of joins on seven different tables.

CREATE VIEW vw_PatientEpisode
AS 
    SELECT p.Patient_Id, p.Gender, CONCAT(p.FirstName, ' ', p.Surname) AS PatientsName, d.DiagnosisName, w.WardName, CONCAT(dr.FirstName, ' ', dr.Surname) AS ConsultantsName, m.GenericName AS Medication
    FROM Patients p
        LEFT JOIN TreatmentEpisode t
            ON t.Patient_Id = p.Patient_Id
        LEFT JOIN Diagnosis d
            ON t.Diagnosis_Id = d.Diagnosis_Id
        LEFT JOIN Ward w
            ON t.Ward_Id = w.Ward_Id
        LEFT JOIN Doctors dr
            ON t.Consultant_Id = dr.Doctor_Id
        LEFT JOIN Prescription pr
            ON p.Patient_Id = pr.Patient_Id
        LEFT JOIN Medication m
            ON pr.Medication_Id = m.Medication_Id;

SELECT * FROM vw_PatientEpisode;


-- Long-term patient (hospital stay of more than 50 days)
SELECT p.Patient_Id, p.Gender, p.PatientsName, p.DiagnosisName, p.WardName, p.ConsultantsName, p.Medication, t.AdmissionDate, t.DischargeDate ,DATEDIFF(t.DischargeDate, t.AdmissionDate) AS DaysOfTreatment
FROM vw_PatientEpisode p
INNER JOIN TreatmentEpisode t
    ON t.Patient_Id = p.Patient_Id
WHERE DATEDIFF(t.DischargeDate, t.AdmissionDate) > 50
ORDER BY DATEDIFF(t.DischargeDate, t.AdmissionDate) DESC;

-- Prepare an example query with group by and having to
-- demonstrate how to extract data from your DB for analysis
-- A query to find out the most common diagnoses (with 3 or more people diagnosed). 

SELECT COUNT(Patient_Id) AS PatientCount, DiagnosisName
FROM vw_PatientEpisode
GROUP BY DiagnosisName
HAVING COUNT(Patient_Id) >= 3
ORDER BY COUNT(Patient_Id) DESC;










