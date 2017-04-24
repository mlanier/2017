
SELECT DISTINCT *

FROM XBITBLSV.RptBBTScrcrdTechMthLgcy AS A 

MINUS 

SELECT  *


FROM XBITBLSV.RptBBTScrcrdTechMthLgcy AS A ;


--Resi positive
SELECT A.CNT-A.Tot,A.Per,A.KMA,A.Tot,A.CNT

FROM
(SELECT COUNT( *) AS CNT,card.ResPosTotalTech AS Tot,card.MtrcTmPeriod AS Per,card.KMADesc AS KMA
FROM 

XBITBLSV.RptBBTScrcrdTechMthLgcy AS card
WHERE card.ResPosQual =1
GROUP BY card.MtrcTmPeriod, card.KMADesc,Tot) AS A 
WHERE A.CNT-A.Tot<>0;

--Resi TC
SELECT A.CNT-A.Tot,A.Per,A.KMA,A.Tot,A.CNT

FROM
(SELECT COUNT( *) AS CNT,card.ResTCTotalTech AS Tot,card.MtrcTmPeriod AS Per,card.KMADesc AS KMA
FROM 

XBITBLSV.RptBBTScrcrdTechMthLgcy AS card
WHERE card.ResTCQual =1
GROUP BY card.MtrcTmPeriod, card.KMADesc,Tot) AS A 
WHERE A.CNT-A.Tot<>0;

--CBTC
SELECT A.CNT-A.Tot,A.Per,A.KMA,A.Tot,A.CNT

FROM
(SELECT COUNT( *) AS CNT,card.CBTCTotalTech AS Tot,card.MtrcTmPeriod AS Per,card.KMADesc AS KMA
FROM 

XBITBLSV.RptBBTScrcrdTechMthLgcy AS card
WHERE card.CBTCQual =1
GROUP BY card.MtrcTmPeriod, card.KMADesc,Tot) AS A 
WHERE A.CNT-A.Tot<>0 AND 
A.KMA
IN (SELECT DISTINCT KMADesc FROM xbitblsv.DimOrgKMA 
WHERE IsCurrfl = 1 AND KMADesc 
NOT LIKE '%KMA%' AND KMADesc NOT LIKE '%Unknown%' AND KMADesc NOT LIKE '%Corp%' );

--CBPOS
SELECT A.CNT-A.Tot,A.Per,A.KMA,A.Tot,A.CNT

FROM
(SELECT COUNT( *) AS CNT,card.CBPOSTotalTech AS Tot,card.MtrcTmPeriod AS Per,card.KMADesc AS KMA
FROM 

XBITBLSV.RptBBTScrcrdTechMthLgcy AS card
WHERE card.CBPOSQual =1
GROUP BY card.MtrcTmPeriod, card.KMADesc,Tot) AS A 
WHERE A.CNT-A.Tot<>0 AND 
A.KMA
IN (SELECT DISTINCT KMADesc FROM xbitblsv.DimOrgKMA 
WHERE IsCurrfl = 1 AND KMADesc 
NOT LIKE '%KMA%' AND KMADesc NOT LIKE '%Unknown%' AND KMADesc NOT LIKE '%Corp%' );

--OTA
SELECT A.CNT-A.Tot,A.Per,A.KMA,A.Tot,A.CNT

FROM
(SELECT COUNT( *) AS CNT,card.OTATotalTech AS Tot,card.MtrcTmPeriod AS Per,card.KMADesc AS KMA
FROM 

XBITBLSV.RptBBTScrcrdTechMthLgcy AS card
WHERE card.OTAQual =1
GROUP BY card.MtrcTmPeriod, card.KMADesc,Tot) AS A 
WHERE A.CNT-A.Tot<>0 AND 
A.KMA
IN (SELECT DISTINCT KMADesc FROM xbitblsv.DimOrgKMA 
WHERE IsCurrfl = 1 AND KMADesc 
NOT LIKE '%KMA%' AND KMADesc NOT LIKE '%Unknown%' AND KMADesc NOT LIKE '%Corp%' );

--PROD
SELECT A.CNT-A.Tot,A.Per,A.KMA,A.Tot,A.CNT

FROM
(SELECT COUNT( *) AS CNT,card.PRODTotalTech AS Tot,card.MtrcTmPeriod AS Per,card.KMADesc AS KMA
FROM 

XBITBLSV.RptBBTScrcrdTechMthLgcy AS card
WHERE card.PRODQual =1
GROUP BY card.MtrcTmPeriod, card.KMADesc,Tot) AS A 
WHERE A.CNT-A.Tot<>0 AND 
A.KMA
IN (SELECT DISTINCT KMADesc FROM xbitblsv.DimOrgKMA 
WHERE IsCurrfl = 1 AND KMADesc 
NOT LIKE '%KMA%' AND KMADesc NOT LIKE '%Unknown%' AND KMADesc NOT LIKE '%Corp%' );


SELECT * FROM XBITBLSV.RptBBTScrcrdTechMthLgcy
AS A
WHERE (A.MtrcTmPeriod<>'MONTH' AND A.DimFsclMthSk IS NOT NULL)
OR (A.MtrcTmPeriod='MONTH' AND A.DimFsclMthSk IS NULL);


SELECT * FROM XBITBLSV.RptBBTScrcrdTechMthLgcy AS A

WHERE A.TechTitle NOT IN 

('Field Technician I','
Field Technician II',
'Field Technician III',
'Field Technician IV',
'Field Technician V');

SELECT CAST(COUNT(TechScrcrdCurrTier)  AS DECIMAL(12,2))
/
(SELECT COUNT(TechScrcrdCurrTier)
FROM XBIAQINTRPTV.RptBBTScrcrdTechMthLgcy
HAVING COUNT(TechScrcrdCurrTier) >0)
, TechScrcrdCurrTier
FROM XBIAQINTRPTV.RptBBTScrcrdTechMthLgcy  
GROUP BY TechScrcrdCurrTier  
HAVING COUNT(TechScrcrdCurrTier) >0 
ORDER BY TechScrcrdCurrTier ;

SELECT COUNT(A.ThruFsclMth) FROM XBITBLSV.RptBBTScrcrdTechMthLgcy AS A
GROUP BY A.HrNum,A.MtrcTmPeriod HAVING COUNT(A.ThruFsclMth)>1;

SELECT * FROM XBITBLSV.RptBBTScrcrdTechMthLgcy AS A
WHERE (A.TotalPnts IS NULL AND A.TechScrcrdCurrTier IS NOT NULL)
OR (A.TotalPnts IS NOT NULL AND A.TechScrcrdCurrTier IS  NULL);


SELECT * FROM XBITBLSV.RptBBTScrcrdTechMthLgcy AS A
WHERE A.HrNum=A.MgrHrNum OR A.HrNum=A.SupHrNum;



