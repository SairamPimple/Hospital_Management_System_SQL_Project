-- 1) DEPARTMENTS  
INSERT INTO Department (Dept_ID, Dept_Name, Location, Phone, Budget) VALUES
  (1, 'Cardiology',       'Building A', '9000000001', 500000.00),
  (2, 'Radiology',        'Building B', '9000000002', 300000.00),
  (3, 'Oncology',         'Building C', '9000000003', 400000.00),
  (4, 'Neurology',        'Building D', '9000000004', 350000.00),
  (5, 'Pediatrics',       'Building E', '9000000005', 450000.00),
  (6, 'Orthopedics',      'Building F', '9000000006', 320000.00),
  (7, 'Dermatology',      'Building G', '9000000007', 200000.00),
  (8, 'Psychiatry',       'Building H', '9000000008', 220000.00),
  (9, 'Gastroenterology', 'Building I', '9000000009', 380000.00),
  (10,'Emergency',        'Building J', '9000000010', 600000.00);

-- 2) STAFF (supervisors first – Supervisor_ID NULL; note use Pin_code not Pincode)
INSERT INTO Staff (
  Emp_ID, Employee_Number, Emp_FName, Emp_LName,
  Date_of_Birth, Gender, Phone, Email, Address, Pincode,
  Date_of_Joining, Emp_Type, Employee_Status, Dept_ID, Supervisor_ID
) VALUES
  (1,'EMP001','Alice','Smith','1980-05-15','Female','9100000001','alice.smith@hosp.com','10 Main St','600001','2019-01-10','Administrator','Active',1,NULL),
  (2,'EMP002','Bob','Johnson','1975-08-20','Male','9100000002','bob.johnson@hosp.com','20 Oak St','600002','2018-07-01','Doctor','Active',1,NULL),
  (3,'EMP003','Carol','Lee','1990-03-30','Female','9100000003','carol.lee@hosp.com','30 Pine St','600003','2021-03-15','Nurse','Active',2,NULL);

-- 3) STAFF (remaining, referencing supervisors above)
INSERT INTO Staff (
  Emp_ID, Employee_Number, Emp_FName, Emp_LName,
  Date_of_Birth, Gender, Phone, Email, Address, Pincode,
  Date_of_Joining, Emp_Type, Employee_Status, Dept_ID, Supervisor_ID
) VALUES
  (4,'EMP004','David','Brown','1988-09-10','Male','9100000004','david.brown@hosp.com','40 Elm St','600004','2022-02-01','Technician','Active',2,1),
  (5,'EMP005','Eva','Davis','1985-12-05','Female','9100000005','eva.davis@hosp.com','50 Maple St','600005','2020-06-20','Support','Active',3,1),
  (6,'EMP006','Frank','Miller','1972-07-14','Male','9100000006','frank.miller@hosp.com','60 Cedar St','600006','2017-11-30','Doctor','Active',3,2),
  (7,'EMP007','Grace','Wilson','1993-10-22','Female','9100000007','grace.wilson@hosp.com','70 Birch St','600007','2021-08-05','Nurse','Active',4,3),
  (8,'EMP008','Henry','Moore','1982-02-17','Male','9100000008','henry.moore@hosp.com','80 Spruce St','600008','2016-04-12','Technician','Active',4,1),
  (9,'EMP009','Ivy','Taylor','1995-11-30','Female','9100000009','ivy.taylor@hosp.com','90 Walnut St','600009','2022-12-01','Doctor','Active',5,6),
  (10,'EMP010','Jack','Anderson','1987-01-25','Male','9100000010','jack.anderson@hosp.com','100 Chestnut St','600010','2019-09-15','Support','Active',5,1);

-- 4) Link Dept Heads (now that staff exist)
UPDATE Department
SET Dept_Head_ID = 2  -- Bob Johnson heads Cardiology
WHERE Dept_ID = 1;

-- 5) PATIENTS
INSERT INTO Patient (
  Patient_ID, Patient_FName, Patient_LName,
  Phone, Email, Blood_Type, Gender,
  Date_of_Birth, Address, Pincode,
  Emergency_Contact_Name, Emergency_Contact_Phone,
  Admission_Date, Patient_Status
) VALUES
  (1,'John','Doe','9200000001','john.doe@example.com','O+','Male','1992-11-25','101 First Ave','600011','Jane Doe','9200000011','2025-06-01 10:00:00','Active'),
  (2,'Mary','Jane','9200000002','mary.jane@example.com','A-','Female','1985-02-14','202 Second Ave','600012','Mark Jane','9200000012','2025-05-20 09:00:00','Transferred'),
  (3,'Paul','Taylor','9200000003','paul.taylor@example.com','B+','Male','1978-07-04','303 Third Ave','600013','Paula Taylor','9200000013','2025-04-10 08:30:00','Active'),
  (4,'Lisa','Brown','9200000004','lisa.brown@example.com','AB+','Female','1990-12-22','404 Fourth Ave','600014','Liam Brown','9200000014','2025-03-15 11:00:00','Discharged'),
  (5,'Kevin','White','9200000005','kevin.white@example.com','O-','Male','1983-05-30','505 Fifth Ave','600015','Karen White','9200000015','2025-06-05 10:15:00','Active'),
  (6,'Nina','Black','9200000006','nina.black@example.com','A+','Female','1996-09-10','606 Sixth Ave','600016','Neil Black','9200000016','2025-05-01 07:45:00','Active'),
  (7,'Oscar','Green','9200000007','oscar.green@example.com','B-','Male','1989-03-18','707 Seventh Ave','600017','Olga Green','9200000017','2025-02-20 12:30:00','Transferred'),
  (8,'Paula','Blue','9200000008','paula.blue@example.com','AB-','Female','1975-08-08','808 Eighth Ave','600018','Peter Blue','9200000018','2025-01-10 09:00:00','Discharged'),
  (9,'Quinn','Gray','9200000009','quinn.gray@example.com','O+','Other','2000-06-06','909 Ninth Ave','600019','Queens Gray','9200000019','2025-06-10 14:00:00','Active'),
  (10,'Rita','Pink','9200000010','rita.pink@example.com','A-','Female','1988-04-04','100 Tenth Ave','600020','Ryan Pink','9200000020','2025-05-18 06:30:00','Transferred');

-- 6) ROOMS
INSERT INTO Room (
  Room_ID, Room_Number, Room_Type,
  Floor_Number, Capacity, Current_Occupancy, Daily_Rate
) VALUES
  (1,'101A','General',1,2,1,2000.00),
  (2,'102A','Private',1,1,0,3500.00),
  (3,'201B','ICU',2,1,1,5000.00),
  (4,'202B','Emergency',2,2,2,4500.00);

-- 7) DOCTORS
INSERT INTO Doctor (
  Doctor_ID, Emp_ID, License_Number, Specialization, Years_of_Experience, Consultation_Fee
) VALUES
  (1,2,'LIC001','Cardiology',5,1500.00),
  (2,6,'LIC002','Radiology',8,2000.00),
  (3,9,'LIC003','Oncology',10,2500.00);

-- 8) NURSES
INSERT INTO Nurse (
  Nurse_ID, Emp_ID, License_Number, Shift_Type, Ward_Assignment
) VALUES
  (1,3,'NLIC001','Day','Ward A'),
  (2,7,'NLIC002','Night','Ward B');

-- 9) PATIENT ROOM ASSIGNMENTS
INSERT INTO Patient_Room_Assignment (
  Assignment_ID, Patient_ID, Room_ID, Admission_Date, Discharge_Date, Daily_Rate
) VALUES
  (1,1,1,'2025-06-01 10:00:00', NULL,      2000.00),
  (2,2,2,'2025-05-20 09:00:00','2025-05-25 15:00:00',5000.00);

-- 10) APPOINTMENTS
INSERT INTO Appointment (
  Appt_ID, Patient_ID, Doctor_ID, Appointment_Date, Appointment_Time,
  Appointment_Type, Status, Reason_for_Visit, Consultation_Fee, Scheduled_By
) VALUES
  (1,1,1,'2026-06-10','14:00:00','Consultation','Confirmed','Chest pain',1500.00,1);

-- 11) MEDICINES
INSERT INTO Medicine (
  Medicine_ID, Medicine_Name, Generic_Name, Medicine_Type,
  Strength, Unit_Cost, Current_Stock, Minimum_Stock_Level, Expiry_Date
) VALUES
  (1,'Paracetamol','Acetaminophen','Tablet','500mg',10.00,100,20,'2026-12-31'),
  (2,'Amoxicillin','Amoxil','Capsule','250mg',20.00,50,10,'2025-11-30');

-- 12) LAB_TESTS
INSERT INTO Lab_Test (
  Test_ID, Test_Name, Test_Category, Normal_Range, Test_Cost
) VALUES
  (1,'Complete Blood Count','Hematology','4.5–11.0 x10^9/L',200.00),
  (2,'Chest X-Ray','Radiology','N/A',500.00);

-- 13) BILLS
INSERT INTO Bill (
  Bill_ID, Patient_ID, Bill_Date, Due_Date,
  Room_Charges, Doctor_Charges, Lab_Charges, Medicine_Charges,
  Tax_Rate, Amount_Paid, Status, Created_By
) VALUES
  (1,1,'2025-06-02','2025-06-15',4000.00,1500.00,200.00,150.00,5.00,2150.00,'Partially Paid',1);

-- 14) PATIENT_VISITS
INSERT INTO Patient_Visit (
  Visit_ID, Patient_ID, Dept_ID, Visit_Date, Symptoms, Visit_Type
) VALUES
  (1,1,1,'2025-06-01 10:00:00','Chest pain','Inpatient');

-- 15) DIAGNOSIS
INSERT INTO Diagnosis (Diagnosis_Code, Description, Category) VALUES
  ('I20','Angina Pectoris','Cardiology'),
  ('J45','Asthma','Pediatrics');

-- 16) PATIENT_DIAGNOSIS
INSERT INTO Patient_Diagnosis (Patient_Diagnosis_ID, Visit_ID, Diagnosis_Code, Is_Primary) VALUES
  (1,1,'I20',TRUE);

-- 17) PROCEDURE_CATALOG
INSERT INTO Procedure_Catalog (Procedure_Code, Description, Category, Cost) VALUES
  ('CATH01','Cardiac catheterization','Cardiology',50000.00);

-- 18) PATIENT_PROCEDURE
INSERT INTO Patient_Procedure (Patient_Procedure_ID, Visit_ID, Procedure_Code, Performed_By, Performed_Date, Cost) VALUES
  (1,1,'CATH01',2,'2025-06-02 14:00:00',50000.00);

-- 19) INSURANCE_PROVIDER
INSERT INTO Insurance_Provider (Insurance_Provider_ID, Name, Contact_Info, Policy_Format) VALUES
  (1,'HealthPlus Insurance','123 Insure Rd','Format A');

-- 20) PATIENT_INSURANCE
INSERT INTO Patient_Insurance (Patient_Insurance_ID, Patient_ID, Insurance_Provider_ID, Policy_Number, Coverage_Details, Effective_Date) VALUES
  (1,1,1,'HP123456','80% up to $10k','2025-01-01');

-- 21) PAYMENTS
INSERT INTO Payment (Payment_ID, Bill_ID, Paid_Amount, Paid_Date, Method, Reference) VALUES
  (1,1,2150.00,'2025-06-03','Online','REF001');

-- 22) BILL_ITEMS
INSERT INTO Bill_Item (Bill_Item_ID, Bill_ID, Item_Type, Item_ID, Quantity, Unit_Cost) VALUES
  (1,1,'Room',    1,2,2000.00),
  (2,1,'Doctor',  1,1,1500.00),
  (3,1,'Lab',     1,1,200.00),
  (4,1,'Medicine',1,15,10.00);

-- 23) STAFF_SHIFT_SCHEDULE
INSERT INTO Staff_Shift_Schedule (Schedule_ID, Emp_ID, Shift_Date, Shift_Type, Location) VALUES
  (1,3,'2025-06-10','Day','Ward A'),
  (2,4,'2025-06-06','Night','Laboratory');

-- 24) EQUIPMENT
INSERT INTO Equipment (Equipment_ID, Name, Model, Serial_Number, Location, Last_Maintenance, Next_Maintenance, Status) VALUES
  (1,'ECG Machine','X1','SN1001','Cardiology','2025-04-01','2025-10-01','Operational');

-- 25) AUDIT_LOG
INSERT INTO Audit_Log (Audit_ID, Table_Name, Record_ID, Action, Changed_By, Change_Details) VALUES
  (1,'Patient',1,'INSERT',1,'{"fields":["Patient_FName"],"new":["John"]}');