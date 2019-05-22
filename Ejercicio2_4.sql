--1
CREATE OR REPLACE PROCEDURE NUM_EMPLE_OFICIO2 
(P_OFICIO EMPLE.OFICIO%TYPE,
P_CURSOR OUT SYS_REFCURSOR,
P_ESTADO OUT VARCHAR2)
IS
V_ERROR VARCHAR(250);
BEGIN
IF NMAX_OFICIO(P_OFICIO)
    THEN
    P_ESTADO:='MAS DE 5 EMPLEADOS';
ELSE
    IF NMAX_OFICIO(P_OFICIO) IS NULL
        THEN P_ESTADO :='NO HAY';
    END IF;
    OPEN P_CURSOR FOR
        SELECT DEPT_NO,DNOMBRE
        FROM DEPART
        WHERE DEPT_NO IN(SELECT DEPT_NO
                                              FROM EMPLE
                                             WHERE UPPER(OFICIO)=UPPER(P_OFICIO)
                                              GROUP BY DEPT_NO
                                              HAVING COUNT(*) =NMAX_OFICIO(P_OFICIO)
                                             );
                                                                             
EXCEPTION
WHEN OTHERS THEN 
NULL;
   
END NUM_EMPLE_OFICIO2;

--2
DECLARE

