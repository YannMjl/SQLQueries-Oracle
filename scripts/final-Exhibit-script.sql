-- ************************************************************************************************
-- Valencia Construction - SQL Part 2                                                             *
-- Exhibits script                                                                                *
-- Author : Christy Ehlert-Mackie, Yann Mulonda, Sara Spring, Ethel Osuji                         *
-- Date : May 22, 2019                                                                            *
-- ************************************************************************************************

-- Exhibit B, Part C- Project Information
SELECT ProjectID, Location, DESCRIPTION
FROM Project;

-- ************************************************************************************************
-- Exhibit B, Part D - Detailed Work Hour Break Down                                              *
-- ************************************************************************************************
-- EEO Hours Minority 
SELECT ESkill.JobClassification 



-- Exhibit C, Part C-Detailed Pay Scale Breakdown for Regular Hours (Overtime =1.5 X the Basic Rate)
SELECT ES.JobSkillCode, 
    ES.JobClassification, 
    P.HourlyPay, 
    Sum(P.HourlyPay + 3) as "Total Compensation"
FROM Pay_Info as P join Employee as E ON P.EmployeeID = E.EmployeeID
                   JOIN Employee_Skill as ES on E.JobSkillCode = ES.JobSkillCode
WHERE P.EmployeeID = "contractor ID";


-- Exhibit D, Part D-Regular Hours
SELECT JobSkillCode AS "Skill Code", 
    HourlyPay AS Rate, 
    Fringe, 
    Sum(Rate + Fringe) as 'Total', 
    NumberOfHours AS 'Hours',
    Hours*(Rate + Fringe) AS Gross
FROM Pay_Info
WHERE EmployeeID = 390054489;


-- Exhibit D, Part E Overtime Hours
SELECT JobSkillCode AS "Skill Code",
    HourlyPay AS Rate,
    Fringe,
    Sum(Rate + Fringe) as 'Total',
    NumberOfHours AS 'Hours',
    Hours*(Rate + Fringe) AS 'Gross'
FROM Pay_Info
WHERE EmployeeID = 275506921;


-- Exhibit D, Part F - Total Hours Worked Per Skill Classification
SELECT JobSkillCode, 
FROM Pay_Info;

-- Exhibit E - General Employee Information
SELECT E.FirstName,
    E.MiddleInitial,
    E.LastName, 
    EA.Address AS 'Street', 
    EA.City, 
    EA.State, 
    EA.ZipCode, 
    E.Phone, 
    E.DOB, 
FROM Employee as E JOIN Employee_Address as EA on E.EmployeeID = EA.EmployeeID
WHERE E.EmployeeID = 390054489;                                                                                     


-- ************************************************************************************************
-- (You may ignore the part of Exhibit F showing Gross, Deductions, Check#, etc.)                 *
-- ************************************************************************************************
-- Exhibit F, Regular Pay
SELECT P.Name AS 'Job',
    PI.JobClassification AS 'Skill'
    PI.HourlyPay AS 'Rate',
    PI.FringePay,
    PI.NumberOfHours AS 'Hours',
    Sum(HourlyPay + Fringe) AS 'Total'
FROM Project as P join Pay_Info AS PI on P.ProjectID = PI.ProjectID;


-- Exhibit F, Overtime Pay
SELECT P.Name AS 'Job',
    PI.JobClassification AS 'Skill'
    PI.HourlyPay AS 'Rate',
    PI.FringePay,
    PI.OverTimeHours AS 'Hours',
    Sum(PI.HourlyPay + PI.FringePay) AS 'Total'
FROM Project as P join Pay_Info AS PI on P.ProjectID = PI.ProjectID;

-- ************************************************************************************************
