-- LEFT, pull characters from the left side of a string
-- also there is a RIGHT
-- LENGTH gives us the number of characters for each row of a specified column
SELECT firstname,
	lastname,
	phonenumber,
	left(phonenumber, 3) AS areacode,
	right(phonenumber, 8) AS phonenumber_only,
	right(phonenumber, length(phonenumber) - 4) AS phonenumber_alt
FROM accounts

-- EXs
-- 1
SELECT RIGHT(website, 3) tlds,
	count(*)
FROM accounts
GROUP BY 1
ORDER BY 2 DESC

-- 2
SELECT left(a.name, 1),
	count(*)
FROM accounts a
GROUP BY 1
ORDER BY 2 DESC

-- 3
SELECT SUM(num) nums,
	SUM(letter) letters
FROM (
	SELECT name,
		CASE 
			WHEN LEFT(UPPER(name), 1) IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
				THEN 1
			ELSE 0
			END AS num,
		CASE 
			WHEN LEFT(UPPER(name), 1) IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
				THEN 0
			ELSE 1
			END AS letter
	FROM accounts
	) t1;

-- 4
SELECT SUM(vowels) vowels,
	SUM(other) other
FROM (
	SELECT name,
		CASE 
			WHEN LEFT(UPPER(name), 1) IN ('A', 'E', 'I', 'O', 'U')
				THEN 1
			ELSE 0
			END AS vowels,
		CASE 
			WHEN LEFT(UPPER(name), 1) IN ('A', 'E', 'I', 'O', 'U')
				THEN 0
			ELSE 1
			END AS other
	FROM accounts
	) t1;

-- POSITION and STRPOS, give you where the character is, they work similarily
-- LOWER and UPPER transforms the case
SELECT first_name,
	last_name,
	city_state,
	POSITION(',' IN city_state) AS comma_position,
	STRPOS(city_state, ',') AS alt_comma_position,
	LOWER(city_state) AS lowercase,
	UPPER(city_state) AS uppercase,
	LEFT(city_state, POSITION(',' IN city_state) - 1) AS city
FROM accounts

-- EXs
-- 1
SELECT LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1) AS first_name,
	RIGHT(primary_poc, (LENGTH(primary_poc) - POSITION(' ' IN primary_poc))) AS last_name
FROM accounts

-- 2
SELECT LEFT(name, POSITION(' ' IN name) - 1) AS first_name,
	RIGHT(name, (LENGTH(name) - POSITION(' ' IN name))) AS last_name
FROM sales_reps

-- CONCAT
SELECT first_name,
	last_name,
	CONCAT (
		first_name,
		' ',
		last_name
		) AS fullname,
FROM accounts

-- same as
SELECT first_name,
	last_name,
	first_name || ' ' || last_name AS fullname_alt
FROM accounts
	-- EXs
	-- 1
	WITH t1 AS (
		SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) first_name,
			RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
			name
		FROM accounts
		)

SELECT first_name,
	last_name,
	CONCAT (
		first_name,
		'.',
		last_name,
		'@',
		name,
		'.com'
		)
FROM t1;

-- 2
WITH t1
AS (
	SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) first_name,
		RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
		name
	FROM accounts
	)
SELECT first_name,
	last_name,
	CONCAT (
		first_name,
		'.',
		last_name,
		'@',
		REPLACE(name, ' ', ''),
		'.com'
		)
FROM t1;

-- 3
WITH t1
AS (
	SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) first_name,
		RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
		name
	FROM accounts
	)
SELECT first_name,
	last_name,
	CONCAT (
		first_name,
		'.',
		last_name,
		'@',
		name,
		'.com'
		),
	LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name), 1) || LENGTH(first_name) || LENGTH(last_name) || REPLACE(UPPER(name), ' ', '')
FROM t1;

-- TO_DATE
DATE_PART('month', TO_DATE(month, 'month')) -- change month name to number

-- CAST, change column type
CAST(date_column AS DATE)
-- or
date_column::date

-- TRIM, remove from beginning and end of string

-- EXs

-- 4
SELECT DATE orig_date,
	(SUBSTR(DATE, 7, 4) || '-' || LEFT(DATE, 2) || '-' || SUBSTR(DATE, 4, 2))::date new_date
FROM sf_crime_data;

-- COALESCE, fill null values with something else
 SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL; 

-- filled
SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;