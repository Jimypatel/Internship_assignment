-- #############################################################################
-- 1. Display all the information of the EMP table

SELECT * 
FROM EMP;

-- #############################################################################
-- 2. Display unique Jobs from EMP table?

SELECT UNIQUE JOB 
FROM EMP;

-- #############################################################################
-- 3.  List the emps in the asc order of their Salaries?

SELECT  *
FROM EMP
ORDER BY SAL ASC;

-- #############################################################################
-- 4. List the details of the emps in asc order of the Dptnos and desc of Jobs?

SELECT *
FROM EMP 
ORDER BY 
DEPTNO ASC, JOB DESC; 

-- #############################################################################
-- 5.Display all the unique job groups in the descending order?

SELECT UNIQUE JOB
FROM EMP
Order by job DESC;

-- #############################################################################
-- 6. Display all the details of all ‘Mgrs’

SELECT * 
FROM EMP
WHERE 
    JOB= 'MANAGER';

-- #############################################################################
-- 7. List the emps who joined before 1981

SELECT *
FROM EMP
WHERE 
    HIREDATE< to_date('1981', 'YYYY');

-- #############################################################################
-- 8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal

SELECT 
    EMPNO, ENAME, SAL, ROUND(SAL/30,2) DAILYSAL, 12*sal ANNSAL
FROM 
    EMP
ORDER BY
    ANNSAL;

-- #############################################################################
-- 9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs

SELECT 
    EMPNO,ENAME,JOB,HIREDATE,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)) EXP
FROM 
    EMP
WHERE 
    EMPNO IN (SELECT MGR FROM EMP);

-- #############################################################################
-- 10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369

SELECT 
    EMPNO,ENAME,SAL,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)) EXP
FROM 
    EMP
WHERE 
    MGR=7369;

-- #############################################################################
-- 11. Display all the details of the emps whose Comm  Is more than their Sal

SELECT *
FROM EMP
WHERE 
    COMM >SAL
    
-- #############################################################################    
-- 13. List the emps along with their Exp and Daily Sal is more than Rs 100

SELECT
    ename,mgr,deptno,hiredate,job, empno,comm,sal,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)) EXP, ROUND(SAL/30) DAILYSAL
FROM EMP
WHERE (SAL/30)>100;

-- #############################################################################        
-- 14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order

SELECT * 
FROM EMP
WHERE 
    JOB = 'CLERK' OR JOB = 'ANALYST'
ORDER BY 
    JOB DESC;

-- #############################################################################        
-- 15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority

SELECT * 
FROM EMP
WHERE
    HIREDATE = '1-MAY-81'
    OR HIREDATE = '3-DEC-81'
    OR HIREDATE = '19-JAN-80' 
    OR HIREDATE = '17-DEC-81'
ORDER BY 
    HIREDATE ASC;
    
-- #############################################################################    
-- 16. List the emp who are working for the Deptno 10 or20

SELECT * 
FROM EMP
WHERE 
    Deptno = 10 OR Deptno = 20;
    
-- #############################################################################    
-- 17. List the emps who are joined in the year 81

SELECT * 
FROM EMP
WHERE  HIREDATE LIKE '%81';

-- #############################################################################    
-- 19. List the emps Who Annual sal ranging from 22000 and 45000

SELECT *
FROM EMP
WHERE SAL*12 BETWEEN 22000 AND 45000;

-- #############################################################################    
-- 20. List the Enames those are having five characters in their Names

SELECT ENAME
FROM EMP
WHERE 
    ENAME LIKE '_____';

-- #############################################################################    
-- 21. List the Enames those are starting with ‘S’ and with five characters

SELECT ENAME
FROM EMP
WHERE 
    ENAME LIKE 'S%';
    
-- #############################################################################        
-- 22. List the emps those are having four chars and third character must be ‘r’

SELECT *
FROM EMP
WHERE 
    ENAME LIKE '__R_';
    
-- #############################################################################        
-- 23. List the Five character names starting with ‘S’ and ending with ‘H’

SELECT *
FROM EMP 
WHERE 
    ENAME LIKE 'S___H';

-- #############################################################################    
-- 24. List the emps who joined in January

SELECT *
FROM EMP
WHERE 
    TO_CHAR(HIREDATE , 'mon') = 'jan';

-- #############################################################################        
-- 27. List the emps whose names having a character set ‘ll’ together

SELECT *
FROM EMP
WHERE 
    ENAME LIKE '%LL%';

-- #############################################################################    
-- 29. List the emps who does not belong to Deptno 20

SELECT *
FROM EMP
WHERE 
    DEPTNO != 20;

-- #############################################################################        
-- 30. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries

SELECT *
FROM EMP 
WHERE 
    JOB != 'PRESIDENT' AND JOB = 'MANAGER'
ORDER BY 
    SAL ASC;

-- #############################################################################    
-- 31.  List the emps whose Empno not starting with digit78

SELECT *
FROM EMP 
WHERE 
    EMPNO NOT LIKE '78%';

-- #############################################################################    
-- 33. List the emps who are working under ‘MGR’

SELECT *
FROM EMP
WHERE 
    JOB NOT LIKE 'MGR';

-- #############################################################################        
-- 34. List the emps who joined in any year but not belongs to the month of March

SELECT *
FROM EMP
WHERE 
    TO_CHAR(HIREDATE, 'mon') != 'march';
 
-- #############################################################################     
-- 35. List all the Clerks of Deptno 20

SELECT *
FROM EMP
WHERE 
    JOB = 'CLERK' AND DEPTNO = 20;
    
-- #############################################################################        
-- 36. List the emps of Deptno 30 or 10 joined in the year 1981

SELECT *
FROM EMP
WHERE 
    (DEPTNO = 30 OR DEPTNO = 10) AND (TO_CHAR(HIREDATE,'YYYY') IN 1981) ;
    
-- #############################################################################        
-- 37. Display the details of SMITH

SELECT *
FROM EMP
WHERE 
    ENAME = 'SMITH';
    
-- #############################################################################    
-- 38. Display the location of SMITH

SELECT LOCATION
FROM 
    EMP E,DEPT D, branch B
WHERE 
    ENAME = 'SMITH' AND E.DEPTNO = D.DEPTNO and D.BRANCHNO = B.BRANCHNO ;
    