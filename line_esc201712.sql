--LDSpPLDSysTechScrcrdWOJobAssnDt001 
/*DROP TABLE DLBIFO.LDSpPLDSysTechScrcrdWOJobAssnDt001;
CREATE MULTISET TABLE DLBIFO.LDSpPLDSysTechScrcrdWOJobAssnDt001 AS

(
 SELECT TOP 1
  DimWOJobSk, 
  a15.BlgStnLvl1Cd, 
  a15.BlgStnLvl2Cd
  FROM XBITblsV.FctWOJob a10
  JOIN XBITblsV.DimWOJobType a11 ON (a10.DimWOJobTypeSk = a11.DimWOJobTypeSk)
  JOIN XBITblsV.DimWOJobRsnCd a12 ON (a10.RsnCd1DimWOJobRsnCdSk=a12.DimWOJobRsnCdSk)
  JOIN XBITblsV.DimWOJobStat a13 ON (a10.DimWOJobStatSk=a13.DimWOJobStatSk)
  JOIN XBITblsV.DimOrgBlgFta a15 ON (a10.DimOrgBlgFtaSk=a15.DimOrgBlgFtaSk)
  
) WITH DATA;
DELETE FROM DLBIFO.LDSpPLDSysTechScrcrdWOJobAssnDt001;*/
SELECT * FROM DLBIFO.LDSpPLDSysTechScrcrdWOJobAssnDt001;
SELECT * FROM DLBIFO.LdSpPLDSysTechScrcrdSecNd002
 SELECT * FROM DLBIFO.LdSpPLDSysTechScrcrdSecNd003;

--PLDSysTechScrcrdWOJobAssnDt
--DROP TABLE DLBIFO.PLDSysTechScrcrdWOJobAssnDt;
/*CREATE MULTISET TABLE DLBIFO.PLDSysTechScrcrdWOJobAssnDt AS 

(SELECT TOP 1 * FROM XBITblsv.PLDSysTechScrcrdWOJobAssnDt
) WITH DATA;*/
--DELETE FROM DLBIFO.PLDSysTechScrcrdWOJobAssnDt;
SELECT * FROM DLBIFO.PLDSysTechScrcrdWOJobAssnDt;
SHOW  PROCEDURE  DLBIFO.SpPLDSysTechScrcrdWOJobAssnDt;
CALL DLBIFO.SpPLDSysTechScrcrdWOJobAssnDt(201704);

--DROP TABLE  DLBIFO.PLDSysTechScrcrdPriNd;
CREATE MULTISET TABLE  DLBIFO.PLDSysTechScrcrdPriNd AS
(SELECT TOP 1 * FROM xbitblsv.PLDSysTechScrcrdPriNd) WITH DATA;
DELETE FROM DLBIFO.PLDSysTechScrcrdPriNd;
SELECT * FROM DLBIFO.PLDSysTechScrcrdPriNd;

SHOW  PROCEDURE  DLBIFO.SpPLDSysTechScrcrdPriNd;

--DROP TABLE  DLBIFO.PLDSysTechScrcrdSecNd;
CREATE MULTISET TABLE  DLBIFO.PLDSysTechScrcrdSecNd AS
(SELECT TOP 1 * FROM xbitblsv.PLDSysTechScrcrdSecNd) WITH DATA;
DELETE FROM DLBIFO.PLDSysTechScrcrdSecNd;
SELECT * FROM DLBIFO.PLDSysTechScrcrdSecNd;
		
		


--DROP TABLE DLBIFO.PLDSysTechScrcrdAllNd;
CREATE MULTISET TABLE DLBIFO.PLDSysTechScrcrdAllNd AS( SELECT TOP 1 * FROM XBITBLSV.PLDSysTechScrcrdAllNd) WITH DATA;
DELETE FROM DLBIFO.PLDSysTechScrcrdAllNd;
SELECT * FROM DLBIFO.PLDSysTechScrcrdAllNd;
SHOW PROCEDURE  DLBIFO.SpPLDSysTechScrcrdAllNd


DROP TABLE DLBIFO.FctSDSysTechScrdLnEsclAvgTmRsp;
CREATE MULTISET TABLE DLBIFO.FctSDSysTechScrdLnEsclAvgTmRsp AS
(
SELECT TOP 1 * FROM XBITblsV.FctSDSysTechScrdLnEsclAvgTmRsp
) WITH DATA;

DELETE FROM DLBIFO.FctSDSysTechScrdLnEsclAvgTmRsp;
SELECT * FROM DLBIFO.FctSDSysTechScrdLnEsclAvgTmRsp;

SHOW  PROCEDURE  DLBIFO.SpFctSDSysTchScrdLnEscAvgTmRsp;



--team and ind
DELETE FROM DLBIFO.PLDSysTechScrcrdTeamLnEscl;
DELETE FROM DLBIFO.PLDSysTechScrcrdAllLnEscl;

SELECT * FROM DLBIFO.PLDSysTechScrcrdTeamLnEscl;
SELECT * FROM DLBIFO.PLDSysTechScrcrdAllLnEscl;

SHOW  PROCEDURE  DLBIFO.SpFctSDSysTchScrdLnEscAvgTmRsp;
SHOW  PROCEDURE  DLBIFO.SpPLDSysTechScrcrdAllLnEscl;
SHOW  PROCEDURE  DLBIFO.SpPLDSysTechScrcrdTeamLnEscl;
SHOW PROCEDURE  DLBIFO.SpPLDSysTechScrcrdAllNd;
SHOW PROCEDURE XBITBLS.SpPLDSysTechScrcrdSecNd
--call procs

CALL DLBIFO.SpPLDSysTechScrcrdPriNd(201704);
CALL DLBIFO.SpPLDSysTechScrcrdSecNd(201704);
CALL DLBIFO.SpPLDSysTechScrcrdWOJobAssnDt(201704);
CALL DLBIFO.SpPLDSysTechScrcrdAllNd();
CALL DLBIFO.SpPLDSysTechScrcrdAllLnEscl(201704);
CALL  DLBIFO.SpFctSDSysTchScrdLnEscAvgTmRsp(201704);

SELECT * FROM  DLBIFO.PLDSysTechScrcrdPriNd;
SELECT * FROM DLBIFO.PLDSysTechScrcrdSecNd;
SELECT * FROM  DLBIFO.PLDSysTechScrcrdWOJobAssnDt;
SELECT * FROM  DLBIFO.PLDSysTechScrcrdAllNd;
SELECT * FROM  DLBIFO.PLDSysTechScrcrdAllLnEscl;
SELECT * FROM DLBIFO.FctSDSysTechScrdLnEsclAvgTmRsp;

CREATE MULTISET TABLE DLBIFO.ML_PLDSysTechScrcrdPriNd AS (SELECT * FROM DLBIFO.PLDSysTechScrcrdPriNd) WITH DATA;
CREATE MULTISET TABLE DLBIFO.ML_PLDSysTechScrcrdSecNd AS (SELECT * FROM DLBIFO.PLDSysTechScrcrdSecNd) WITH DATA;
CREATE MULTISET TABLE DLBIFO.ML_PLDSysTechScrcrdWOJobAssnDt AS (SELECT * FROM DLBIFO.PLDSysTechScrcrdWOJobAssnDt) WITH DATA;
CREATE MULTISET TABLE DLBIFO.ML_PLDSysTechScrcrdAllNd AS (SELECT * FROM DLBIFO.PLDSysTechScrcrdAllNd) WITH DATA;
CREATE MULTISET TABLE DLBIFO.ML_PLDSysTechScrcrdAllLnEscl AS (SELECT * FROM DLBIFO.PLDSysTechScrcrdAllLnEscl) WITH DATA;
CREATE MULTISET TABLE DLBIFO.ML_FctSDSysTechScrdLnEsclAvgTmRsp AS (SELECT * FROM DLBIFO.FctSDSysTechScrdLnEsclAvgTmRsp) WITH DATA;

SELECT * FROM DLBIFO.ML_PLDSysTechScrcrdPriNd ;
SELECT * FROM DLBIFO.ML_PLDSysTechScrcrdSecNd ;
SELECT * FROM DLBIFO.ML_PLDSysTechScrcrdWOJobAssnDt ;
SELECT * FROM DLBIFO.ML_PLDSysTechScrcrdAllNd ;
SELECT * FROM DLBIFO.ML_PLDSysTechScrcrdAllLnEscl ;
SELECT * FROM DLBIFO.ML_FctSDSysTechScrdLnEsclAvgTmRsp ;



--get rpt



/*SELECT A.HrNum,NewKma.MgmtArea,A.AttrWeight,A.TotTeamLeCnt,A.AvgMnthAttr,A.ExecStatId,A.SnapDttm,A.InsDttm,A.RecopInd FROM   DLBIFO.PLDSysTechScrcrdTeamLnEscl AS A
LEFT JOIN xbimdmv.MdmPsftEmpMgmtArea AS NewKMA ON A.HrNum = NewKMA.HrNum 
WHERE newkma.DimFsclMthSk = '201705'
;*/


