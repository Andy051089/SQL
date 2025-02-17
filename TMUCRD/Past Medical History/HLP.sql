SELECT DISTINCT *
INTO OPD_HLP
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
where ICD9_CODE1 like '272.[249]' or ICD9_CODE2 like '272.[249]' or ICD9_CODE3 like '272.[249]'
		or ICD9_CODE4 like '272.[249]' or ICD9_CODE5 like '272.[249]' or ICD10_CODE1 like 'E78.[245]'
		or ICD10_CODE2 like 'E78.[245]' or ICD10_CODE3 like 'E78.[245]' or ICD10_CODE4 like 'E78.[245]'
		or ICD10_CODE5 like 'E78.[245]'

SELECT DISTINCT *
INTO IPD_HLP
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
where 
	EDIAG_CODE like '272.[249]' OR ESDIAG_CODE1 like '272.[249]' OR
	ESDIAG_CODE2 like '272.[249]' OR ESDIAG_CODE3 like '272.[249]' OR 
	ESDIAG_CODE4 like '272.[249]' OR MDIAG_CODE like '272.[249]' OR
	SDIAG_CODE1 like '272.[249]' OR SDIAG_CODE2 like '272.[249]' OR 
	SDIAG_CODE3 like '272.[249]' OR SDIAG_CODE4 like '272.[249]' OR
	SDIAG_CODE5 like '272.[249]' OR SDIAG_CODE6 like '272.[249]' OR
	SDIAG_CODE7 like '272.[249]' OR ICD10_CODE1 like 'E78.[245]' OR 
	ICD10_CODE2 like 'E78.[245]' OR ICD10_CODE3 like 'E78.[245]' OR
	ICD10_CODE4 like 'E78.[245]' OR ICD10_CODE5 like 'E78.[245]' OR
	ICD10_CODE6 like 'E78.[245]' OR ICD10_CODE7 like 'E78.[245]' OR 
	ICD10_CODE1_OUT like 'E78.[245]' OR ICD10_CODE2_OUT like 'E78.[245]' OR
	ICD10_CODE3_OUT like 'E78.[245]' OR ICD10_CODE4_OUT like 'E78.[245]' OR 
	ICD10_CODE5_OUT like 'E78.[245]' OR ICD10_CODE6_OUT like 'E78.[245]' OR 
	ICD10_CODE7_OUT like 'E78.[245]' OR ICD10_CODE8_OUT like 'E78.[245]'

SELECT ID_NO, COUNT(FEE_NO) AS VISITS_TIMES
INTO LUNGCA_FINAL_HLP
FROM (
	SELECT ID_NO, FEE_NO
	FROM OPD_HLP
UNION ALL
	SELECT ID_NO, FEE_NO
	FROM IPD_HLP
)AS TEMP
GROUP BY ID_NO
HAVING COUNT(FEE_NO) > 1

DROP TABLE LUNGCA_FINAL_HLP

SELECT DISTINCT T2.FEE_NO,T2.ID_NO
INTO LUNGCA_FINAL_HLP
FROM (
    SELECT ID_NO
    FROM(
        SELECT t.ID_NO, t.FEE_NO
        FROM IPD_HLP T
    UNION ALL
        SELECT t1.ID_NO, t1.FEE_NO
        FROM OPD_HLP T1
    ) AS TEMP
    GROUP BY ID_NO
    HAVING COUNT(FEE_NO) > 1
) T1
INNER JOIN (
    SELECT ID_NO, FEE_NO
    FROM IPD_HLP
    UNION ALL
    SELECT ID_NO, FEE_NO
    FROM OPD_HLP
) T2 ON T1.ID_NO = T2.ID_NO