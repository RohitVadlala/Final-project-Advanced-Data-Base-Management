
-- What is the total revenue generated from transaction fees for a given time period?

SELECT SUM(tt.transaction_fee) AS total_revenue
FROM transaction t
JOIN transaction_type tt ON t.tran_type_id = tt.tran_type_id
WHERE t.date_of_transaction BETWEEN '2023-01-01' AND '2023-12-31';

-- total transfer fee generated from transactions is $37 in whole 2023 year



-- Which accounts have a negative balance, and how many such accounts exist?

SELECT a.account_id, a.balance_account
FROM account a
WHERE a.balance_account < 0;

SELECT COUNT(*) AS negative_balance_accounts_count
FROM account
WHERE balance_account < 0;


-- There are no accounts with negative balance in the account in all branches


-- What is the average transaction amount per account type for the last quarter?


SELECT aty.account_type, AVG(t.transaction_amount) AS average_transaction_amount
FROM transaction t
JOIN account a ON t.source_account_id = a.account_id
JOIN account_type aty ON a.account_type_id = aty.account_type_id
WHERE t.date_of_transaction >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY aty.account_type;


-- average transaction amount of each type is displayed below, student account has the highest average transaction amount


-- Which clients have performed transactions over a certain high-value threshold in the last year?


SELECT DISTINCT c.client_id, c.first_name, c.last_name
FROM client c
JOIN account a ON c.client_id=a.account_id
JOIN transaction t ON a.account_id = t.source_account_id
WHERE t.transaction_amount > 500 -- assuming the threshold value is 500
AND t.date_of_transaction BETWEEN '2023-01-01' AND '2023-12-31';

-- only two client ELLIS KIRK and SCOTTY ARMOUR have done transactions over threshold which is more than 500.
