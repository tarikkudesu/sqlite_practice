-- 8.1 Obtain the names of all physicians that have performed a medical procedure they have never been certified to perform.
select d.Name from Undergoes u
    inner join Physician d on u.Physician = d.EmployeeID
    where u.Procedures not in (
        select Treatment from Trained_In t
        where t.Physician = d.EmployeeID
    );

Name            
----------------
Christopher Turk

-- 8.2 Same as the previous query, but include the following information in the results: Physician name, name of procedure, date when the procedure was carried out, name of the patient the procedure was carried out on.
select d.Name, p.Name, u.DateUndergoes, j.Name from Undergoes u
    inner join Physician d on u.Physician = d.EmployeeID
    inner join Procedures p on u.Procedures = p.Code
    inner join Patient j on u.Patient = j.SSN
    where u.Procedures not in (
        select Treatment from Trained_In t
        where t.Physician = d.EmployeeID
    );

Name              Name                   DateUndergoes  Name      
----------------  ---------------------  -------------  ----------
Christopher Turk  Complete Walletectomy  2008-05-13     Dennis Doe

-- 8.3 Obtain the names of all physicians that have performed a medical procedure that they are certified to perform, but such that the procedure was done at a date (Undergoes.Date) after the physician's certification expired (Trained_In.CertificationExpires).
select p.Name from Undergoes u
    inner join Physician p on u.Physician = p.EmployeeID
    inner join Trained_In t on t.Physician = u.Physician and t.Treatment = u.Procedures
    where u.DateUndergoes > t.CertificationExpires;

Name        
------------
Todd Quinlan

-- 8.4 Same as the previous query, but include the following information in the results: Physician name, name of procedure, date when the procedure was carried out, name of the patient the procedure was carried out on, and date when the certification expired.
select d.Name, p.Name, u.DateUndergoes, j.Name, t.CertificationExpires from Undergoes u
    inner join Physician d on u.Physician = d.EmployeeID
    inner join Procedures p on u.Procedures = p.Code
    inner join Patient j on u.Patient = j.SSN
    inner join Trained_In t on t.Physician = u.Physician and t.Treatment = u.Procedures
    where u.DateUndergoes > t.CertificationExpires;

Name          Name                        DateUndergoes  Name        CertificationExpires
------------  --------------------------  -------------  ----------  --------------------
Todd Quinlan  Obfuscated Dermogastrotomy  2008-05-09     Dennis Doe  2007-12-31          

-- 8.5 Obtain the information for appointments where a patient met with a physician other than his/her primary care physician. Show the following information: Patient name, physician name, nurse name (if any), start and end time of appointment, examination room, and the name of the patient's primary care physician.
select p.Name, d.Name, n.Name, a.Start, a.End, a.ExaminationRoom, dd.Name from Appointment a
    inner join Patient p on p.SSN = a.Patient
    inner join Physician d on d.EmployeeID = a.Physician
    left join Nurse n on n.EmployeeID = PrepNurse
    inner join Physician dd on dd.EmployeeID = p.PCP
    where p.PCP <> Physician;

Name        Name          Name          Start             End               ExaminationRoom  Name            
----------  ------------  ------------  ----------------  ----------------  ---------------  ----------------
Dennis Doe  Percival Cox  Paul Flowers  2008-04-25 10:00  2008-04-25 11:00  B                Christopher Turk
Dennis Doe  Percival Cox                2008-04-26 10:00  2008-04-26 11:00  C                Christopher Turk
John Smith  Christopher                 2008-04-26 12:00  2008-04-26 13:00  C                John Dorian     
Dennis Doe  Molly Clock   Laverne Robe  2008-04-27 10:00  2008-04-21 11:00  A                Christopher Turk

-- 8.6 The Patient field in Undergoes is redundant, since we can obtain it from the Stay table. There are no constraints in force to prevent inconsistencies between these two tables. More specifically, the Undergoes table may include a row where the patient ID does not match the one we would obtain from the Stay table through the Undergoes.Stay foreign key. Select all rows from Undergoes that exhibit this inconsistency.
select u.* from Undergoes u
    inner join Stay s on s.StayID = u.Stay
    where u.Patient <> s.Patient;

Patient     Procedures  Stay        DateUndergoes  Physician   AssistingNurse
----------  ----------  ----------  -------------  ----------  --------------
100000001   7           3217        2008-05-10     7           101           

-- 8.7 Obtain the names of all the nurses who have ever been on call for room 123.
select n.Name from On_Call o
    inner join Nurse n on n.EmployeeID = o.Nurse
    inner join Room r on o.BlockFloor = r.BlockFloor and o.BlockCode = r.BlockCode
    where r.RoomNumber = 123;

Name           
---------------
Laverne Roberts
Paul Flowers 

-- 8.8 The hospital has several examination rooms where appointments take place. Obtain the number of appointments that have taken place in each examination room.
select ExaminationRoom, count(AppointmentID) from Appointment group by ExaminationRoom;

ExaminationRoom  count(AppointmentID)
---------------  --------------------
A                2                   
B                2                   
C                3

-- 8.9 Obtain the names of all patients (also include, for each patient, the name of the patient's primary care physician), such that **all** the following are true:
    -- The patient has been prescribed some medication by his/her primary care physician.
    -- The patient has undergone a procedure with a cost larger that $5,000
    -- The patient has had at least two appointment where the nurse who prepped the appointment was a registered nurse.
    -- The patient's primary care physician is not the head of any department.

select p.Name, d.Name from Patient p
    inner join Physician d on d.EmployeeID = p.PCP
    where exists (
        select * from Prescribes where Physician = p.PCP and Patient = p.SSN
    ) and exists (
        select * from Undergoes un
            inner join Procedures pr on pr.Code = un.Procedures
            where pr.Cost > 5000 and Patient = p.SSN
    ) and 2 <= (
        select count(*) from Appointment ap
            left join Nurse nu on nu.EmployeeID = ap.PrepNurse and nu.Registered is True
            where ap.Patient = p.SSN
    ) and not exists (
        select de.* from Department de where p.PCP = de.Head
    );

Name        Name       
----------  -----------
John Smith  John Dorian
