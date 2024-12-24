SELECT DISTINCT *
INTO OPD_PEPTIC
FROM(
	SELECT
		t1.ID_no, t.CHR_NO, t.FEE_NO,
		t.ICD10_CODE1, t.ICD10_CODE2, t.ICD10_CODE3, 
		t.ICD10_CODE4, t.ICD10_CODE5, t.ICD9_CODE1, 
		t.ICD9_CODE2, t.ICD9_CODE3, t.ICD9_CODE4, t.ICD9_CODE5
	FROM v_opd_basic_s t
	INNER JOIN v_chr_basic_s t1
	ON t.chr_no = t1.CHR_NO
union all
	SELECT
		t1.ID_no, t.CHR_NO, t.FEE_NO, 
		t.ICD10_CODE1, t.ICD10_CODE2, t.ICD10_CODE3, 
		t.ICD10_CODE4, t.ICD10_CODE5, t.ICD9_CODE1, 
		t.ICD9_CODE2, t.ICD9_CODE3, t.ICD9_CODE4, t.ICD9_CODE5
	FROM v_opd_basic_t t
	INNER JOIN v_chr_basic_T t1
	ON t.chr_no = t1.CHR_NO
union all
	SELECT
		t1.ID_no, t.CHR_NO, t.FEE_NO, 
		t.ICD10_CODE1, t.ICD10_CODE2, t.ICD10_CODE3, 
		t.ICD10_CODE4, t.ICD10_CODE5, t.ICD9_CODE1, 
		t.ICD9_CODE2, t.ICD9_CODE3, t.ICD9_CODE4, t.ICD9_CODE5
	FROM v_opd_basic_w t
	INNER JOIN v_chr_basic_W t1
	ON t.chr_no = t1.CHR_NO
) as temp
WHERE EXISTS (
    SELECT 1
    FROM (VALUES 
        (temp.ICD9_CODE1), (temp.ICD9_CODE2), (temp.ICD9_CODE3), (temp.ICD9_CODE4), (temp.ICD9_CODE5),
        (temp.ICD10_CODE1), (temp.ICD10_CODE2), (temp.ICD10_CODE3), (temp.ICD10_CODE4), (temp.ICD10_CODE5)
    ) v(code)
    WHERE 
        code like '53[1-4]%' 
        or code like 'K2[5-8]%')

SELECT DISTINCT *
INTO IPD_PEPTIC
FROM(
	SELECT
		t1.ID_no, t.CHR_NO, t.FEE_NO,
		t.EDIAG_CODE, T.ESDIAG_CODE1, T.ESDIAG_CODE2, 
		T.ESDIAG_CODE3, T.ESDIAG_CODE4, MDIAG_CODE,
		T.SDIAG_CODE1, T.SDIAG_CODE2, T.SDIAG_CODE3,
		T.SDIAG_CODE4, T.SDIAG_CODE5, T.SDIAG_CODE6,
		T.SDIAG_CODE7, T.ICD10_CODE1, T.ICD10_CODE2, 
		T.ICD10_CODE3, T.ICD10_CODE4, T.ICD10_CODE5,
		T.ICD10_CODE6, T.ICD10_CODE7, T.ICD10_CODE1_OUT, 
		T.ICD10_CODE2_OUT, T.ICD10_CODE3_OUT, T.ICD10_CODE4_OUT, 
		T.ICD10_CODE5_OUT, T.ICD10_CODE6_OUT, T.ICD10_CODE7_OUT,
		T.ICD10_CODE8_OUT		
	FROM v_ipd_basic_s t
	INNER JOIN v_chr_basic_s t1
	ON t.chr_no = t1.CHR_NO
union all
	SELECT
		t1.ID_no, t.CHR_NO, t.FEE_NO,
		t.EDIAG_CODE, T.ESDIAG_CODE1, T.ESDIAG_CODE2, 
		T.ESDIAG_CODE3, T.ESDIAG_CODE4, MDIAG_CODE,
		T.SDIAG_CODE1, T.SDIAG_CODE2, T.SDIAG_CODE3,
		T.SDIAG_CODE4, T.SDIAG_CODE5, T.SDIAG_CODE6,
		T.SDIAG_CODE7, T.ICD10_CODE1, T.ICD10_CODE2, 
		T.ICD10_CODE3, T.ICD10_CODE4, T.ICD10_CODE5,
		T.ICD10_CODE6, T.ICD10_CODE7, T.ICD10_CODE1_OUT, 
		T.ICD10_CODE2_OUT, T.ICD10_CODE3_OUT, T.ICD10_CODE4_OUT, 
		T.ICD10_CODE5_OUT, T.ICD10_CODE6_OUT, T.ICD10_CODE7_OUT,
		T.ICD10_CODE8_OUT
	FROM v_ipd_basic_t t
	INNER JOIN v_chr_basic_T t1
	ON t.chr_no = t1.CHR_NO
union all
	SELECT
		t1.ID_no, t.CHR_NO, t.FEE_NO,
		t.EDIAG_CODE, T.ESDIAG_CODE1, T.ESDIAG_CODE2, 
		T.ESDIAG_CODE3, T.ESDIAG_CODE4, MDIAG_CODE,
		T.SDIAG_CODE1, T.SDIAG_CODE2, T.SDIAG_CODE3,
		T.SDIAG_CODE4, T.SDIAG_CODE5, T.SDIAG_CODE6,
		T.SDIAG_CODE7, T.ICD10_CODE1, T.ICD10_CODE2, 
		T.ICD10_CODE3, T.ICD10_CODE4, T.ICD10_CODE5,
		T.ICD10_CODE6, T.ICD10_CODE7, T.ICD10_CODE1_OUT, 
		T.ICD10_CODE2_OUT, T.ICD10_CODE3_OUT, T.ICD10_CODE4_OUT, 
		T.ICD10_CODE5_OUT, T.ICD10_CODE6_OUT, T.ICD10_CODE7_OUT,
		T.ICD10_CODE8_OUT
	FROM v_ipd_basic_w t
	INNER JOIN v_chr_basic_W t1
	ON t.chr_no = t1.CHR_NO
) as temp
WHERE EXISTS (
   SELECT 1
   FROM (VALUES 
       (temp.EDIAG_CODE), (temp.ESDIAG_CODE1), (temp.ESDIAG_CODE2), (temp.ESDIAG_CODE3), 
       (temp.ESDIAG_CODE4), (temp.MDIAG_CODE), (temp.SDIAG_CODE1), (temp.SDIAG_CODE2),
       (temp.SDIAG_CODE3), (temp.SDIAG_CODE4), (temp.SDIAG_CODE5), (temp.SDIAG_CODE6),
       (temp.SDIAG_CODE7), (temp.ICD10_CODE1), (temp.ICD10_CODE2), (temp.ICD10_CODE3),
       (temp.ICD10_CODE4), (temp.ICD10_CODE5), (temp.ICD10_CODE6), (temp.ICD10_CODE7),
       (temp.ICD10_CODE1_OUT), (temp.ICD10_CODE2_OUT), (temp.ICD10_CODE3_OUT),
       (temp.ICD10_CODE4_OUT), (temp.ICD10_CODE5_OUT), (temp.ICD10_CODE6_OUT),
       (temp.ICD10_CODE7_OUT), (temp.ICD10_CODE8_OUT)
   ) v(code)
       WHERE 
        code like '53[1-4]%' 
        or code like 'K2[5-8]%')


SELECT ID_NO, COUNT(FEE_NO) AS VISITS_TIMES
INTO LUNGCA_FINAL_PEPTIC
FROM(
	SELECT t.ID_NO, t.FEE_NO
	FROM IPD_PEPTIC T
UNION ALL
	SELECT t1.ID_NO, t1.FEE_NO
	FROM OPD_PEPTIC T1
) AS TEMP
GROUP BY ID_NO
HAVING COUNT(FEE_NO) > 1

DROP TABLE LUNGCA_FINAL_PEPTIC

SELECT DISTINCT T2.FEE_NO,T2.ID_NO
INTO LUNGCA_FINAL_PEPTIC
FROM (
    SELECT ID_NO
    FROM(
        SELECT t.ID_NO, t.FEE_NO
        FROM IPD_PEPTIC T
    UNION ALL
        SELECT t1.ID_NO, t1.FEE_NO
        FROM OPD_PEPTIC T1
    ) AS TEMP
    GROUP BY ID_NO
    HAVING COUNT(FEE_NO) > 1
) T1
INNER JOIN (
    SELECT ID_NO, FEE_NO
    FROM IPD_PEPTIC
    UNION ALL
    SELECT ID_NO, FEE_NO
    FROM OPD_PEPTIC
) T2 ON T1.ID_NO = T2.ID_NO