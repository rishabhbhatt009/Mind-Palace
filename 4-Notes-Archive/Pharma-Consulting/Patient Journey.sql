/* ===================================================================================================
Elahere Analog Analysis : PADCEV 
====================================================================================================== */

--------------------------------------------
--- Eligible Patients 
--------------------------------------------
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_eligible_pts;

CREATE TABLE wkspc_analysis__c.eaa_padcev_eligible_pts AS 
(
	SELECT patient_id
	FROM
	(
		SELECT patient_id, MIN(transaction_date) AS min_date, COUNT(DISTINCT claim_id) AS num_diagnosis
		FROM  compass_report_current__v.vdc_padcev_patient_072019_092023_longitudinal_patient__v 
		WHERE 
		diagnosis_code_1 IN ('C651','C652','C659','C661','C662','C669','C670','C671','C672','C673','C674','C675','C676','C677','C678','C679','C680','C688')
		OR diagnosis_code_2 IN ('C651','C652','C659','C661','C662','C669','C670','C671','C672','C673','C674','C675','C676','C677','C678','C679','C680','C688')
		OR diagnosis_code_3 IN ('C651','C652','C659','C661','C662','C669','C670','C671','C672','C673','C674','C675','C676','C677','C678','C679','C680','C688')
		OR diagnosis_code_4 IN ('C651','C652','C659','C661','C662','C669','C670','C671','C672','C673','C674','C675','C676','C677','C678','C679','C680','C688')	
		GROUP BY 1
	)
	WHERE num_diagnosis > 1 
)
;

--------------------------------------------
--- Market Basket  
--------------------------------------------

DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_market_basket;

CREATE TABLE wkspc_analysis__c.eaa_padcev_market_basket (
    brand_name VARCHAR(255),
    compound_name VARCHAR(255),
    drug_name VARCHAR(255),
    drug_type VARCHAR(255)
);

INSERT INTO wkspc_analysis__c.eaa_padcev_market_basket (brand_name, compound_name, drug_name, drug_type)
VALUES 
('TECENTRIQ', 'ATEZOLIZUMAB', 'ATEZOLIZUMAB', 'IMMUNOTHERAPY'),
('BAVENCIO', 'AVELUMAB', 'AVELUMAB', 'IMMUNOTHERAPY'),
('CARBOPLATIN', 'CARBOPLATIN', 'CARBOPLATIN', 'CHEMO PT'),
('PARAPLATIN', 'CARBOPLATIN', 'CARBOPLATIN', 'CHEMO PT'),
('CISPLATIN', 'CISPLATIN', 'CISPLATIN', 'CHEMO PT'),
('DOCETAXEL', 'DOCETAXEL', 'DOCETAXEL', 'CHEMO'),
('TAXOTERE', 'DOCETAXEL', 'DOCETAXEL', 'CHEMO'),
('ADRIAMYCIN', 'DOXORUBICIN', 'DOXORUBICIN', 'CHEMO'),
('DOXORUBICIN HYDROCHLORIDE', 'DOXORUBICIN', 'DOXORUBICIN', 'CHEMO'),
('IMFINZI', 'DURVALUMAB', 'DURVALUMAB', 'IMMUNOTHERAPY'),
('PADCEV', 'ENFORTUMAB VEDOTIN', 'PADCEV', 'ADC'),
('BALVERSA', 'ERDAFITINIB', 'ERDAFITINIB', 'KINASE INHIBITOR'),
('GEMCITABINE', 'GEMCITABINE', 'GEMCITABINE', 'CHEMO'),
('GEMZAR', 'GEMCITABINE', 'GEMCITABINE', 'CHEMO'),
('JELMYTO', 'MITOMYCIN', 'MITOMYCIN', 'CHEMO'),
('MITOMYCIN', 'MITOMYCIN', 'MITOMYCIN', 'CHEMO'),
('MITOMYCIN-C', 'MITOMYCIN', 'MITOMYCIN', 'CHEMO'),
('MUTAMYCIN', 'MITOMYCIN', 'MITOMYCIN', 'CHEMO'),
('OPDIVO', 'NIVOLUMAB', 'NIVOLUMAB', 'IMMUNOTHERAPY'),
('ELOXATIN', 'OXALIPLATIN', 'OXALIPLATIN', 'CHEMO PT'),
('OXALIPLATIN', 'OXALIPLATIN', 'OXALIPLATIN', 'CHEMO PT'),
('PACLITAXEL', 'PACLITAXEL', 'PACLITAXEL', 'CHEMO'),
('KEYTRUDA', 'PEMBROLIZUMAB', 'PEMBROLIZUMAB', 'IMMUNOTHERAPY'),
('TRODELVY', 'SACITUZUMAB GOVITECAN', 'TRODELVY', 'ADC'),
('VINBLASTINE SULFATE', 'VINBLASTINE', 'VINBLASTINE', 'CHEMO'),
('ENHERTU', 'TRASTUZUMAB DERUXTECAN', 'ENHERTU', 'ADC'),
('BCG', 'BCG ', 'BCG ', 'IMMUNOTHERAPY'),
('CAMPTOSAR', 'IRINOTECAN', 'IRINOTECAN', 'CHEMO'),
('ONIVYDE', 'IRINOTECAN', 'IRINOTECAN', 'CHEMO')
;

--------------------------------------------
--- Market Basket : Rx Table 
--------------------------------------------
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_market_basket_rx;

CREATE TABLE wkspc_analysis__c.eaa_padcev_market_basket_rx AS 
(
	WITH CTE1 AS 
	(	
		SELECT *,
		CASE
		WHEN UPPER(product_name) LIKE '%TECENTRIQ%' OR UPPER(product_desc) LIKE '%TECENTRIQ%' OR UPPER(compound_name) LIKE '%ATEZOLIZUMAB%' THEN 'atezolizumab'
		WHEN UPPER(product_name) LIKE '%BAVENCIO%' OR UPPER(product_desc) LIKE '%BAVENCIO%' OR UPPER(compound_name) LIKE '%AVELUMAB%' THEN 'avelumab'
		WHEN UPPER(product_name) LIKE '%CARBOPLATIN%' OR UPPER(product_desc) LIKE '%CARBOPLATIN%' OR UPPER(compound_name) LIKE '%CARBOPLATIN%' THEN 'carboplatin'
		WHEN UPPER(product_name) LIKE '%PARAPLATIN%' OR UPPER(product_desc) LIKE '%PARAPLATIN%' OR UPPER(compound_name) LIKE '%CARBOPLATIN%' THEN 'carboplatin'
		WHEN UPPER(product_name) LIKE '%CISPLATIN%' OR UPPER(product_desc) LIKE '%CISPLATIN%' OR UPPER(compound_name) LIKE '%CISPLATIN%' THEN 'cisplatin'
		WHEN UPPER(product_name) LIKE '%DOCETAXEL%' OR UPPER(product_desc) LIKE '%DOCETAXEL%' OR UPPER(compound_name) LIKE '%DOCETAXEL%' THEN 'docetaxel'
		WHEN UPPER(product_name) LIKE '%TAXOTERE%' OR UPPER(product_desc) LIKE '%TAXOTERE%' OR UPPER(compound_name) LIKE '%DOCETAXEL%' THEN 'docetaxel'
		WHEN UPPER(product_name) LIKE '%ADRIAMYCIN%' OR UPPER(product_desc) LIKE '%ADRIAMYCIN%' OR UPPER(compound_name) LIKE '%DOXORUBICIN%' THEN 'doxorubicin'
		WHEN UPPER(product_name) LIKE '%DOXORUBICIN HYDROCHLORIDE%' OR UPPER(product_desc) LIKE '%DOXORUBICIN HYDROCHLORIDE%' OR UPPER(compound_name) LIKE '%DOXORUBICIN%' THEN 'doxorubicin'
		WHEN UPPER(product_name) LIKE '%IMFINZI%' OR UPPER(product_desc) LIKE '%IMFINZI%' OR UPPER(compound_name) LIKE '%DURVALUMAB%' THEN 'durvalumab'
		WHEN UPPER(product_name) LIKE '%PADCEV%' OR UPPER(product_desc) LIKE '%PADCEV%' OR UPPER(compound_name) LIKE '%ENFORTUMAB VEDOTIN%' THEN 'padcev'
		WHEN UPPER(product_name) LIKE '%BALVERSA%' OR UPPER(product_desc) LIKE '%BALVERSA%' OR UPPER(compound_name) LIKE '%ERDAFITINIB%' THEN 'erdafitinib'
		WHEN UPPER(product_name) LIKE '%GEMCITABINE%' OR UPPER(product_desc) LIKE '%GEMCITABINE%' OR UPPER(compound_name) LIKE '%GEMCITABINE%' THEN 'gemcitabine'
		WHEN UPPER(product_name) LIKE '%GEMZAR%' OR UPPER(product_desc) LIKE '%GEMZAR%' OR UPPER(compound_name) LIKE '%GEMCITABINE%' THEN 'gemcitabine'
		WHEN UPPER(product_name) LIKE '%JELMYTO%' OR UPPER(product_desc) LIKE '%JELMYTO%' OR UPPER(compound_name) LIKE '%MITOMYCIN%' THEN 'mitomycin'
		WHEN UPPER(product_name) LIKE '%MITOMYCIN%' OR UPPER(product_desc) LIKE '%MITOMYCIN%' OR UPPER(compound_name) LIKE '%MITOMYCIN%' THEN 'mitomycin'
		WHEN UPPER(product_name) LIKE '%MITOMYCIN-C%' OR UPPER(product_desc) LIKE '%MITOMYCIN-C%' OR UPPER(compound_name) LIKE '%MITOMYCIN%' THEN 'mitomycin'
		WHEN UPPER(product_name) LIKE '%MUTAMYCIN%' OR UPPER(product_desc) LIKE '%MUTAMYCIN%' OR UPPER(compound_name) LIKE '%MITOMYCIN%' THEN 'mitomycin'
		WHEN UPPER(product_name) LIKE '%OPDIVO%' OR UPPER(product_desc) LIKE '%OPDIVO%' OR UPPER(compound_name) LIKE '%NIVOLUMAB%' THEN 'nivolumab'
		WHEN UPPER(product_name) LIKE '%ELOXATIN%' OR UPPER(product_desc) LIKE '%ELOXATIN%' OR UPPER(compound_name) LIKE '%OXALIPLATIN%' THEN 'oxaliplatin'
		WHEN UPPER(product_name) LIKE '%OXALIPLATIN%' OR UPPER(product_desc) LIKE '%OXALIPLATIN%' OR UPPER(compound_name) LIKE '%OXALIPLATIN%' THEN 'oxaliplatin'
		WHEN UPPER(product_name) LIKE '%PACLITAXEL%' OR UPPER(product_desc) LIKE '%PACLITAXEL%' OR UPPER(compound_name) LIKE '%PACLITAXEL%' THEN 'paclitaxel'
		WHEN UPPER(product_name) LIKE '%KEYTRUDA%' OR UPPER(product_desc) LIKE '%KEYTRUDA%' OR UPPER(compound_name) LIKE '%PEMBROLIZUMAB%' THEN 'pembrolizumab'
		WHEN UPPER(product_name) LIKE '%TRODELVY%' OR UPPER(product_desc) LIKE '%TRODELVY%' OR UPPER(compound_name) LIKE '%SACITUZUMAB GOVITECAN%' THEN 'trodelvy'
		WHEN UPPER(product_name) LIKE '%VINBLASTINE SULFATE%' OR UPPER(product_desc) LIKE '%VINBLASTINE SULFATE%' OR UPPER(compound_name) LIKE '%VINBLASTINE%' THEN 'vinblastine'
		WHEN UPPER(product_name) LIKE '%ENHERTU%' OR UPPER(product_desc) LIKE '%ENHERTU%' OR UPPER(compound_name) LIKE '%TRASTUZUMAB DERUXTECAN%' THEN 'enhertu'
		WHEN UPPER(product_name) LIKE '%BCG%' OR UPPER(product_desc) LIKE '%BCG%' OR UPPER(compound_name) LIKE '%BCG %' THEN 'BCG '
		WHEN UPPER(product_name) LIKE '%CAMPTOSAR%' OR UPPER(product_desc) LIKE '%CAMPTOSAR%' OR UPPER(compound_name) LIKE '%IRINOTECAN%' THEN 'irinotecan'
		WHEN UPPER(product_name) LIKE '%ONIVYDE%' OR UPPER(product_desc) LIKE '%ONIVYDE%' OR UPPER(compound_name) LIKE '%IRINOTECAN%' THEN 'irinotecan'
		ELSE NULL
		END AS drug_name
		FROM compass_report_current__v.vdc_padcev_patient_072019_092023_longitudinal_patient__v
		WHERE 
		drug_name IS NOT NULL 
		AND product_id IS NOT NULL
		AND product_name IS NOT NULL
	)
	
	SELECT 
		DISTINCT
		a.product_id AS ndc__c, 
		a.product_desc AS description__c,
		a.drug_name AS drug__c,
		b.drug_type AS type__c
	FROM CTE1 a
	LEFT JOIN wkspc_analysis__c.eaa_padcev_market_basket b
	ON UPPER(a.drug_name) = UPPER(b.drug_name)
)
;

--------------------------------------------
--- Market Basket : Px Table 
--------------------------------------------
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_market_basket_px;

CREATE TABLE wkspc_analysis__c.eaa_padcev_market_basket_px AS 
(
	WITH CTE1 AS 
	(	
		SELECT *,
		CASE
		WHEN UPPER(procedure_code_desc) LIKE '%ATEZOLIZUMAB%' THEN 'atezolizumab'
		WHEN UPPER(procedure_code_desc) LIKE '%AVELUMAB%' THEN 'avelumab'
		WHEN UPPER(procedure_code_desc) LIKE '%CARBOPLATIN%' THEN 'carboplatin'
		WHEN UPPER(procedure_code_desc) LIKE '%CARBOPLATIN%' THEN 'carboplatin'
		WHEN UPPER(procedure_code_desc) LIKE '%CISPLATIN%' THEN 'cisplatin'
		WHEN UPPER(procedure_code_desc) LIKE '%DOCETAXEL%' THEN 'docetaxel'
		WHEN UPPER(procedure_code_desc) LIKE '%DOCETAXEL%' THEN 'docetaxel'
		WHEN UPPER(procedure_code_desc) LIKE '%DOXORUBICIN%' THEN 'doxorubicin'
		WHEN UPPER(procedure_code_desc) LIKE '%DOXORUBICIN%' THEN 'doxorubicin'
		WHEN UPPER(procedure_code_desc) LIKE '%DURVALUMAB%' THEN 'durvalumab'
		WHEN UPPER(procedure_code_desc) LIKE '%ENFORTUMAB VEDOTIN%' THEN 'padcev'
		WHEN UPPER(procedure_code_desc) LIKE '%ERDAFITINIB%' THEN 'erdafitinib'
		WHEN UPPER(procedure_code_desc) LIKE '%GEMCITABINE%' THEN 'gemcitabine'
		WHEN UPPER(procedure_code_desc) LIKE '%GEMCITABINE%' THEN 'gemcitabine'
		WHEN UPPER(procedure_code_desc) LIKE '%MITOMYCIN%' THEN 'mitomycin'
		WHEN UPPER(procedure_code_desc) LIKE '%MITOMYCIN%' THEN 'mitomycin'
		WHEN UPPER(procedure_code_desc) LIKE '%MITOMYCIN%' THEN 'mitomycin'
		WHEN UPPER(procedure_code_desc) LIKE '%MITOMYCIN%' THEN 'mitomycin'
		WHEN UPPER(procedure_code_desc) LIKE '%NIVOLUMAB%' THEN 'nivolumab'
		WHEN UPPER(procedure_code_desc) LIKE '%OXALIPLATIN%' THEN 'oxaliplatin'
		WHEN UPPER(procedure_code_desc) LIKE '%OXALIPLATIN%' THEN 'oxaliplatin'
		WHEN UPPER(procedure_code_desc) LIKE '%PACLITAXEL%' THEN 'paclitaxel'
		WHEN UPPER(procedure_code_desc) LIKE '%PEMBROLIZUMAB%' THEN 'pembrolizumab'
		WHEN UPPER(procedure_code_desc) LIKE '%SACITUZUMAB GOVITECAN%' THEN 'trodelvy'
		WHEN UPPER(procedure_code_desc) LIKE '%VINBLASTINE%' THEN 'vinblastine'
		WHEN UPPER(procedure_code_desc) LIKE '%TRASTUZUMAB DERUXTECAN%' THEN 'enhertu'
		WHEN UPPER(procedure_code_desc) LIKE '%BCG %' THEN 'BCG '
		WHEN UPPER(procedure_code_desc) LIKE '%IRINOTECAN%' THEN 'irinotecan'
		WHEN UPPER(procedure_code_desc) LIKE '%IRINOTECAN%' THEN 'irinotecan'
		ELSE NULL
		END AS drug_name
		FROM compass_report_current__v.vdc_padcev_patient_072019_092023_longitudinal_patient__v
		WHERE 
		drug_name IS NOT NULL 		
		AND procedure_code IS NOT NULL
		AND procedure_code_desc IS NOT NULL
	)
	
	SELECT 
		DISTINCT 
		a.procedure_code as cpt_code__c,
		a.procedure_code_desc as description__c,
		a.drug_name AS drug__c,
		b.drug_type AS type__c
	FROM CTE1 a
	LEFT JOIN wkspc_analysis__c.eaa_padcev_market_basket b
	ON UPPER(a.drug_name) = UPPER(b.drug_name) 
)
;

--------------------------------------------
--- base table
---- all rx/px in our market basket 
--------------------------------------------
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_base_table;

CREATE TABLE wkspc_analysis__c.eaa_padcev_base_table as 
(
	SELECT patient_id, TO_DATE(transaction_date,'yyyy-mm-dd') as transaction_date_d, 
		procedure_code, procedure_code_desc,
		product_id, product_name, days_supply, route
	FROM compass_report_current__v.vdc_padcev_patient_072019_092023_longitudinal_patient__v 
	WHERE
	product_id IN (select ndc__c from wkspc_analysis__c.eaa_padcev_market_basket_rx)
	OR procedure_code IN (select cpt_code__c from wkspc_analysis__c.eaa_padcev_market_basket_px) 
)
;

--------------------------------------------
--- days of supply + rxpx code + generic names
--------------------------------------------

DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_therapy_type;

CREATE TABLE wkspc_analysis__c.eaa_padcev_therapy_type AS 
(

	--FILLING IN DAYS OF SUPPLY  
	WITH eaa_dos_table AS 
	(
		SELECT  *, 
			CASE
			WHEN (days_supply LIKE '') OR (days_supply IS NULL) THEN 28 
			ELSE cast(days_supply as INTEGER) END AS days_of_supply	
		FROM wkspc_analysis__c.eaa_padcev_base_table
	),

	--RX/PX MATCH + combine Rx/Px code in single column 
	eaa_rxpx_code_table AS
	(
		SELECT  *, 
			CASE 
			WHEN product_id IN (select ndc__c from wkspc_analysis__c.eaa_padcev_market_basket_rx)
			THEN product_id
			WHEN procedure_code in (select procedure_code from wkspc_analysis__c.eaa_padcev_market_basket_px) 
			THEN procedure_code
			ELSE NULL END AS rxpx_code
		FROM eaa_dos_table
	)

	-- add generic name + therapy type 
	SELECT 
		a.patient_id, a.transaction_date_d AS transaction_date, a.days_of_supply, 
		COALESCE(b.drug__c, c.drug__c) AS rxpx_name,
		COALESCE(b.type__c, c.type__c) AS rxpx_type
			
	FROM eaa_rxpx_code_table a
	LEFT JOIN wkspc_analysis__c.eaa_padcev_market_basket_px b
	ON a.rxpx_code = b.cpt_code__c 
	LEFT JOIN wkspc_analysis__c.eaa_padcev_market_basket_rx c
	ON a.rxpx_code = c.ndc__c
	ORDER BY a.patient_id, transaction_date
);

--------------------------------------------
--- gaps
--------------------------------------------

--CALCULATONG GAPS BETWEEN TRANSACTIONS
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_gap;
CREATE TABLE wkspc_analysis__c.eaa_padcev_gap AS 
(
	SELECT *, 
		transaction_date - LAG(transaction_date) OVER (PARTITION BY patient_id ORDER BY patient_id, transaction_date) AS gap 
	FROM wkspc_analysis__c.eaa_padcev_therapy_type
	ORDER BY patient_id, transaction_date, gap DESC
);

--------------------------------------------
--- episodes
--------------------------------------------

DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_episode;

CREATE TABLE wkspc_analysis__c.eaa_padcev_episode AS
(
	-- create falg 
	WITH CTE1 AS
	(
		SELECT *, 
			--- transaction date + dos + grace (=7)
			(transaction_date + days_of_supply + 7) AS transaction_end_date,
			-- flag for episode start 
			CASE WHEN transaction_date - MAX(transaction_date) OVER (PARTITION BY rxpx_name, patient_id ORDER BY transaction_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) <= days_of_supply + 7
			THEN 0 ELSE 1 END AS flag
		FROM
		(
			SELECT DISTINCT patient_id, rxpx_name, rxpx_type, transaction_date, days_of_supply
			FROM wkspc_analysis__c.eaa_padcev_gap
		)
	),

	-- episode number
	CTE2 AS
	(
		SELECT *, 
			SUM(flag) OVER (
				PARTITION BY rxpx_name, patient_id 
				ORDER BY transaction_date ASC 
				ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
			) AS episode_number
		FROM CTE1
	),

	-- episode start and end 
	CTE3 AS
	(
		SELECT *,
			MIN(transaction_date) OVER (
				PARTITION BY rxpx_name, episode_number, patient_id
			) AS episode_start_date,
			
			MAX(transaction_end_date) OVER (
				PARTITION BY rxpx_name, episode_number, patient_id
			) AS episode_end_date
		FROM CTE2
	)
	 
	SELECT patient_id, rxpx_type, rxpx_name, episode_number, episode_start_date, episode_end_date
	FROM CTE3
	WHERE flag = 1
)
;

--------------------------------------------
--- regimen
--------------------------------------------

DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_temp_regimen;
CREATE TABLE wkspc_analysis__c.eaa_padcev_temp_regimen AS
(
	WITH 

	-- Create a table of unique dates from task_episode table, considering patient_id
	UniqueDates AS (
		SELECT patient_id ,episode_start_date AS unique_date
		FROM wkspc_analysis__c.eaa_padcev_episode
		UNION
		SELECT patient_id, episode_end_date
		FROM wkspc_analysis__c.eaa_padcev_episode
	),

	-- Create intervals from the unique dates, considering patient_id
	Intervals AS (
		SELECT 
			T1.patient_id,
			T1.unique_date AS temp_start, 
			MIN(T2.unique_date) AS temp_end
		FROM UniqueDates T1, UniqueDates T2
		WHERE T1.unique_date < T2.unique_date AND T1.patient_id = T2.patient_id
		GROUP BY T1.patient_id, T1.unique_date
	),

	-- Identify which regimens are active within each interval for each patient_id
	Activeregimens AS (
		SELECT 
			I.patient_id,
			I.temp_start,
			I.temp_end,
			T.rxpx_name,
			T.rxpx_type
		
		FROM Intervals I
		JOIN wkspc_analysis__c.eaa_padcev_episode T
		ON I.temp_start >= T.episode_start_date AND I.temp_end <= T.episode_end_date AND I.patient_id = T.patient_id
	)

	-- Select the active regimens within each interval, grouped by patient_id
	SELECT 
		patient_id,
		rxpx_name AS regimen_name,
		rxpx_type AS regimen_type,
		temp_start, 
		temp_end
	FROM ActiveRegimens
	ORDER BY temp_start
)
;

---step 2: combine episode, group by temp_start and temp_end

DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_regimen ;
CREATE TABLE wkspc_analysis__c.eaa_padcev_regimen AS
(
	WITH 

	TempCTE AS 
	(
		SELECT DISTINCT patient_id, temp_start, temp_end
		FROM wkspc_analysis__c.eaa_padcev_temp_regimen
	),

	RegimenCTE AS 
	(
		SELECT
			t.patient_id,
			t.temp_start,
			t.temp_end,
			LISTAGG(DISTINCT r.regimen_name, ' + ') 
			WITHIN GROUP (ORDER BY r.REGIMEN_TYPE,R.REGIMEN_NAME) AS combined_regimen_NAME,
			LISTAGG(DISTINCT r.regimen_TYPE, ' + ') 
			WITHIN GROUP (ORDER BY r.REGIMEN_TYPE,R.REGIMEN_NAME) AS combined_regimen_TYPE
			
			/*
			-- add chemo regimens 
			LISTAGG(
				DISTINCT 
				CASE WHEN UPPER(r.regimen_type) LIKE '%CHEMO%' 
				THEN r.regimen_name ELSE NULL END, ' + '
			) 
			WITHIN GROUP (ORDER BY r.REGIMEN_TYPE,R.REGIMEN_NAME) AS combined_chemo_regimen_name,
			
			-- add immuno / adc column 
			LISTAGG(
				DISTINCT 
				CASE WHEN UPPER(r.regimen_type) NOT LIKE '%CHEMO%' 
				AND UPPER(r.regimen_name) != 'AVELUMAB'
				THEN r.regimen_name ELSE NULL END, ' + '
				) 
			WITHIN GROUP (ORDER BY r.REGIMEN_TYPE,R.REGIMEN_NAME) AS combined_main_regimen_name,
			
			-- add maintainance 
			LISTAGG(
				DISTINCT 
				CASE WHEN UPPER(r.regimen_name) = 'AVELUMAB'
				THEN r.regimen_name ELSE NULL END, ' + '
				) 
			WITHIN GROUP (ORDER BY r.REGIMEN_TYPE,R.REGIMEN_NAME) AS combined_maintainance_regimen_name
			*/
			
		FROM TempCTE t
		JOIN wkspc_analysis__c.eaa_padcev_temp_regimen r 
		ON t.patient_id = r.patient_id AND t.temp_start = r.temp_start AND t.temp_end = r.temp_end
		GROUP BY t.patient_id, t.temp_start, t.temp_end
	)

	SELECT
	  patient_id,
	  combined_regimen_name AS regimen_name,
	  combined_regimen_TYPE AS regimen_type,
	  -- new addition 
	  ---combined_chemo_regimen_name AS chemo_regimen_name,
	  ---combined_main_regimen_name AS main_regimen_name,
	  ---combined_maintainance_regimen_name AS maintainance_regimen_name,
	  
	  temp_start AS regimen_start,
	  temp_end AS regimen_end
	FROM RegimenCTE
	ORDER BY patient_id, temp_start
)
;

--------------------------------------------
--- lines
--------------------------------------------

DROP TABLE IF EXISTS wkspc_analysis__c.eaa_padcev_lines;
CREATE TABLE wkspc_analysis__c.eaa_padcev_lines 
AS 
(
	WITH 
	--- base table
	CTE1 AS 
	(
		SELECT *,
		COMBO_START - LAG(COMBO_END) OVER (PARTITION BY PATIENT_ID ORDER BY COMBO_NUM) AS COMBO_GAP,
		COMBO_END-COMBO_START AS COMBO_LENGTH
		FROM 
		(
			SELECT DISTINCT 
				PATIENT_ID,
				ROW_NUMBER()OVER(PARTITION BY PATIENT_ID ORDER BY REGIMEN_START,REGIMEN_END) AS COMBO_NUM,
				REGIMEN_NAME AS THERAPY_NAME,
				REGIMEN_TYPE AS THERAPY_TYPE,
				---chemo_regimen_name AS CHEMO_THERAPY_NAME,
				---main_regimen_name AS MAIN_THERAPY_NAME,
				---maintainance_regimen_name AS MAINTAINANCE_THERAPY_NAME,
				REGIMEN_START AS COMBO_START,
				REGIMEN_END AS COMBO_END
			FROM wkspc_analysis__c.eaa_padcev_regimen
			-- 
			WHERE COMBO_END-COMBO_START>7
		)
		ORDER BY PATIENT_ID, COMBO_NUM
	),
	
	CTE2 AS 
	(
		SELECT *, 
		LAG(THERAPY_NAME) OVER(PARTITION BY PATIENT_ID ORDER BY COMBO_START,COMBO_END) AS PREV_THERAPY_NAME,
		LAG(THERAPY_TYPE) OVER(PARTITION BY PATIENT_ID ORDER BY COMBO_START,COMBO_END) AS PREV_THERAPY_TYPE
		---LAG(CHEMO_THERAPY_NAME) OVER(PARTITION BY PATIENT_ID ORDER BY COMBO_START,COMBO_END) AS PREV_CHEMO_THERAPY_NAME,
		---LAG(MAIN_THERAPY_NAME) OVER(PARTITION BY PATIENT_ID ORDER BY COMBO_START,COMBO_END) AS PREV_MAIN_THERAPY_NAME,
		---LAG(MAINTAINANCE_THERAPY_NAME) OVER(PARTITION BY PATIENT_ID ORDER BY COMBO_START,COMBO_END) AS PREV_MAINTAINANCE_THERAPY_NAME
		FROM CTE1
	),
	
	--- LOT Flag + Rules 
	CTE3 AS
	(
		SELECT *, 
			CASE 
			-- first combo
			WHEN COMBO_GAP IS NULL 
			THEN 1
			
			-- line change 
			WHEN COMBO_GAP>=180 
			THEN 1 
			
			-- no line change if mono maintainance
			WHEN UPPER(THERAPY_NAME) = ('AVELUMAB') 
			THEN 0 
			
			-- line change if not mono maintainance
			WHEN COMBO_GAP>=90 AND UPPER(THERAPY_NAME) != ('AVELUMAB') 
			THEN 1 		
			
			-- no line change if curr and prev Chemo PT (PT dominates)
			WHEN COMBO_GAP<90 AND (UPPER(THERAPY_TYPE) LIKE '%CHEMO PT%' AND UPPER(PREV_THERAPY_TYPE) LIKE '%CHEMO PT%')
			THEN 0
			
			-- curr therapy a subset of prev
			WHEN COMBO_GAP<90 
			AND 
			TRIM(REGEXP_REPLACE(UPPER(PREV_THERAPY_NAME), '((AVELUMAB)(\\s\\+)*)*', ''))
			LIKE 
			'%'||REPLACE(UPPER(TRIM(REGEXP_REPLACE(UPPER(THERAPY_NAME), '((AVELUMAB)(\\s\\+)*)*', ''))), '+', '%')||'%' 
			THEN 0
			
			-- curr therapy not a subset of prev
			WHEN COMBO_GAP<90 
			AND 
			TRIM(REGEXP_REPLACE(UPPER(PREV_THERAPY_NAME), '((AVELUMAB)(\\s\\+)*)*', ''))
			NOT LIKE 
			'%'||REPLACE(UPPER(TRIM(REGEXP_REPLACE(UPPER(THERAPY_NAME), '((AVELUMAB)(\\s\\+)*)*', ''))), '+', '%')||'%' 
			THEN 1
			
			ELSE NULL
			END AS LINE_FLAG_1
		
		FROM CTE2
	)
	
	--- LOT Number  
	-- SELECT patient_id, combo_num, therapy_name, therapy_type, combo_start, combo_end, combo_gap, combo_length, line_flag_1, line_therapy, 
	SELECT *,
	SUM(LINE_FLAG_1) OVER(PARTITION BY PATIENT_ID ORDER BY COMBO_NUM, COMBO_GAP DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS LINE_THERAPY
	FROM CTE3	
)
;

/* ===================================================================================================
EDA Queries
====================================================================================================== */

----------------------------------
--- Patient Funnel 
----------------------------------

--- Patient count in universe 
SELECT COUNT (DISTINCT patient_id) as TOTAL_PTS
FROM compass_report_current__v.vdc_padcev_patient_072019_092023_longitudinal_patient__v ;

-- Eligible patient Counts Dx
SELECT COUNT(DISTINCT patient_id)
FROM wkspc_analysis__c.eaa_padcev_eligible_pts
;

-- Eligible patient Counts Dx + Rx 
SELECT COUNT(DISTINCT a.patient_id)
FROM wkspc_analysis__c.eaa_padcev_eligible_pts a
INNER JOIN wkspc_analysis__c.eaa_padcev_base_table b
ON a.patient_id = b.patient_id
;


----------------------------------
--- Market Basket 
----------------------------------

-- product  
SELECT a.product_name, a.product_desc, a.product_category, a.product_j_code, ta1, ta2, ta3, COUNT(DISTINCT a.patient_id) as num_pts
FROM compass_report_current__v.vdc_padcev_patient_072019_092023_longitudinal_patient__v a 
--INNER JOIN wkspc_analysis__c.eaa_eligible_pts b
--ON a.patient_id = b.patient_id
--WHERE a.product_name IS NOT NULL
AND (UPPER(ta1) LIKE '%CANCER%' OR UPPER(ta2) LIKE '%CANCER%' OR UPPER(ta3) LIKE '%CANCER%')
GROUP BY 1,2,3,4,5,6,7
ORDER BY num_pts DESC
;

-- procedures 
SELECT a.procedure_code , a.procedure_code_desc, COUNT(DISTINCT a.patient_id) as num_pts
FROM compass_report_current__v.vdc_padcev_patient_072019_092023_longitudinal_patient__v a 
INNER JOIN wkspc_analysis__c.eaa_eligible_pts b
ON a.patient_id = b.patient_id
WHERE a.procedure_code IS NOT NULL
GROUP BY 1,2
HAVING num_pts > 400
ORDER BY num_pts DESC
;

---mb check 
-- SELECT DISTINCT a.product_id, a.product_desc, a.compound_name, a.product_j_code, a.procedure_code, a.procedure_code_desc
SELECT DISTINCT a.procedure_code, a.procedure_code_desc
FROM compass_report_current__v.vdc_padcev_patient_072019_092023_longitudinal_patient__v a
WHERE procedure_code IN ()


----------------------------------
-- DOS
----------------------------------
SELECT product_name, MEDIAN(days_supply)  
FROM 
(
  SELECT DISTINCT product_name, days_supply
  FROM wkspc_analysis__c.eaa_base_table
)
GROUP BY 1

----------------------------------
-- surgeries 
----------------------------------
SELECT DISTINCT a.product_id, a.product_desc, a.compound_name, a.product_j_code, a.procedure_code, a.procedure_code_desc
FROM compass_report_current__v.vdc_padcev_patient_072019_092023_longitudinal_patient__v a
WHERE 
LOWER(procedure_code_desc) LIKE '%transurethral%resection%of%bladder%' 
OR LOWER(procedure_code_desc) LIKE '%cystectomy%' 
OR LOWER(procedure_code_desc) LIKE '%urinary%diversion%' 
OR LOWER(procedure_code_desc) LIKE '%neobladder%reconstruction%'
OR LOWER(procedure_code_desc) LIKE '%lymph%node%dissection%'

----------------------------------
--- patients by LOT
----------------------------------

--- all patients
SELECT line_therapy, COUNT(DISTINCT a.patient_id) 
FROM wkspc_analysis__c.eaa_padcev_lines a
INNER JOIN wkspc_analysis__c.eaa_padcev_eligible_pts b
ON a.patient_id = b.patient_id
GROUP BY 1
ORDER BY 1
;

--- padcev in by line
SELECT line_therapy, COUNT(DISTINCT a.patient_id) 
FROM wkspc_analysis__c.eaa_padcev_lines a
INNER JOIN wkspc_analysis__c.eaa_padcev_eligible_pts b
ON a.patient_id = b.patient_id

WHERE UPPER(therapy_name) LIKE '%PADCEV%'
GROUP BY 1
ORDER BY 1
;

--- first padcev by line
SELECT line_therapy, COUNT(DISTINCT patient_id) 
FROM (
	SELECT a.patient_id, therapy_name, line_therapy, ROW_NUMBER() OVER (PARTITION BY a.patient_id ORDER BY line_therapy ASC) as rnk
	FROM wkspc_analysis__c.eaa_padcev_lines a 
	INNER JOIN wkspc_analysis__c.eaa_padcev_eligible_pts b
	ON a.patient_id = b.patient_id
	WHERE UPPER(therapy_name) LIKE '%PADCEV%'
)
WHERE rnk=1
GROUP BY 1
ORDER BY 1
;

--------------------------------------
--- Sample Journies
--------------------------------------
SELECT *
FROM wkspc_analysis__c.eaa_padcev_lines a
-- WHERE patient_id = 'PT74H97VUDY4SZ57QHXR'
-- WHERE patient_id = 'PT74H97VUDY4SZ15PKWM'
-- WHERE patient_id = 'PT74H97VUDY4SZ59WF26'
-- WHERE patient_id = 'PT74H97VUDY4SZ15PKWM'
WHERE patient_id = 'PT74H97VUDY4SZ7F1GPS' --- initiated L1 (>5)
-- WHERE patient_id = 'PT74H97VUDY4SZ7F1GPS' --- initiated L1 (>5)
-- WHERE patient_id = 'PT74H97VUDY4SZ50YREZ' --- initiated L1 (>5)
-- WHERE patient_id = 'PT74H97VUDY4SZ51CA1O' --- initiated L1 (1)
-- WHERE patient_id = 'PT74H97VUDY4SZ51FT3A' --- initiated L1 (1)

-- WHERE line_flag_1 IS NULL

-- LIMIT 10

----------------------------------
----removing all tables
----------------------------------
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_eligible_pts;
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_market_basket;
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_market_basket_rx;
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_market_basket_px;
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_base_table;
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_therapy_type;
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_gap;
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_episode;
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_temp_regimen;
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_regimen ;
DROP TABLE IF EXISTS wkspc_analysis__c.eaa_lines_1;


/* ===================================================================================================
====================================================================================================== */
