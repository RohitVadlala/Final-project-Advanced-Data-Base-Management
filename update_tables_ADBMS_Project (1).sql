-- Update total balance in transaction table for transaction_type in (1,2,3,4(source account)
UPDATE transaction t
JOIN account a ON t.source_account_id = a.account_id
JOIN transaction_type tt ON t.tran_type_id = tt.tran_type_id
SET t.total_balance = 
    CASE
        WHEN tt.tran_type_id = 1 THEN a.balance_account - CAST(t.transaction_amount AS DECIMAL(15, 2)) - tt.transaction_fee
        WHEN tt.tran_type_id = 2 THEN a.balance_account - CAST(t.transaction_amount AS DECIMAL(15, 2)) - tt.transaction_fee
        WHEN tt.tran_type_id = 3 THEN a.balance_account + CAST(t.transaction_amount AS DECIMAL(15, 2)) - tt.transaction_fee
        WHEN tt.tran_type_id = 4 THEN a.balance_account - CAST(t.transaction_amount AS DECIMAL(15, 2)) - tt.transaction_fee
    END
WHERE tt.tran_type_id IN (1, 2, 3, 4)

-- Update for transaction_type = 4 (destination account)
UPDATE account a
JOIN transaction t ON a.account_id = t.destination_account_id  
JOIN transaction_type tt ON t.tran_type_id = tt.tran_type_id
SET a.balance_account = a.balance_account + CAST(t.transaction_amount AS DECIMAL(15, 2))
WHERE tt.tran_type_id = 4;

-- update balance_amount in account table for source_account_id
UPDATE account a
JOIN transaction t ON a.account_id = t.source_account_id
SET a.balance_account=t.total_balance;

-- Update client age
UPDATE client
SET age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
