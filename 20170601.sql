SELECT * FROM

		(SELECT * FROM XBITBLSV.DimEmployee 

		WHERE TitlNm IN (SELECT TechTitle FROM XBIMdmV.MdmTechOpsScrcdTitle) AND ExpDttm BETWEEN DATE'2017-04-01' AND DATE'2017-04-30') AS A

INNER JOIN 

		(SELECT * FROM XBITBLSV.DimEmployee 

		WHERE TitlNm IN (SELECT TechTitle FROM XBIMdmV.MdmTechOpsScrcdTitle) AND EffDttm BETWEEN DATE'2017-04-01' AND DATE'2017-04-30') AS B

ON A.HrNum=B.HrNum
WHERE A.DimEmployeeSk <> B.DimEmployeeSk
