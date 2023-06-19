use bank;

-- QUERY 1
select client_id
from client
where district_id = 1
order by client_id asc
limit 5;

-- QUERY 2
select max(client_id)
from client
where district_id = 72;

-- QUERY 3
select amount
from loan
order by amount asc
limit 3;

-- QUERY 4
select distinct(status)
from loan
order by status asc;

-- QUERY 5
select loan_id, amount, payments
from loan
order by amount desc;

select loan_id, amount, payments
from loan
order by payments desc;

	-- Highest amount 590820 is loan_id 6534, but expected data: 10944 - id 6312 
    -- Highest payments 9910 is loan_id 6415, but expected data: 304 - id 6312
    
-- QUERY 6
select account_id, amount from loan
order by account_id asc
limit 5;

-- QUERY 7
select account_id
from loan
where duration = 60
order by amount asc
limit 5;

-- QUERY 8
select distinct(k_symbol) from `order`;

-- QUERY 9
select order_id
from `order`
where account_id = 34;

-- QUERY 10
select distinct(account_id)
from `order`
WHERE order_id BETWEEN 29540 AND 29560;

-- QUERY 11
select amount
from `order`
where account_to = 30067122;

-- QUERY 12
select trans_id, date, type, amount
from trans
where account_id = 793
order by date desc;

-- QUERY 13
select count(client_id), district_id
from client
where district_id < 10
group by district_id
order by district_id asc;

-- QUERY 14
select count(type), type
from card
group by type;

-- QUERY 15
select account_id, amount
from loan
order by amount desc
limit 10;

-- QUERY 16
select date, count(date)
from loan
where date < 930907
group by date
order by date desc;

-- QUERY 17
select date, duration, count(loan_id)
from loan 
where date like "9712%" 
group by date, duration 
order by date, duration;

-- QUERY 18
select account_id, type, sum(amount) from trans
where account_id = 396
group by type;

-- QUERY 19
select account_id, 
case
	when type = "PRIJEM" THEN "Incoming"
	when type = "VYDAJ" THEN "Outgoing"
	else "Error"
end as "transaction_type", 
round(sum(amount),0)
from trans
where account_id = 396
group by type;

-- QUERY 20
SELECT
    account_id,
    round(SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END),0) AS total_prijem,
    round(SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END),0) AS total_vydaj,
    round(SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE -amount END),0) AS difference
FROM
    trans
WHERE
    account_id = 396;


-- QUERY 21
SELECT
    account_id,
    round(SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END), 0) AS total_prijem,
    round(SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END), 0) AS total_vydaj,
    round(SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE -amount END), 0) AS difference
FROM
    trans
GROUP BY
    account_id
ORDER BY
    (total_prijem - total_vydaj) DESC
LIMIT 10;


-- I HAD TO DO QUITE A BIT OF RESEARCH TO DO THE LAST ONES, I'M NOT SURED I MISSED SOMETHING IMPORTANT DURING THE LESSON
-- BUT THIS IS AS GOOD AS I COULD DO. QUERY 21 SHOWS CORRECT ANSWERS FOR THE ACCOUNT_ID'S BUT NOT FOR THE DIFFERENCE. I'M
-- NOT COMPLETELY SURE I UNDERSTAND WHAT TOOLS WE SHOULD HAVE USED ON THOSE EXERCISES AND WOULD APPRECIATE A REFERENCE TO
-- READ ABOUT IT OR A SHORT EXPLANATION. Thank you very much.

