
-- Deleting void transactions
DELETE FROM transaction
WHERE transaction_amount IS NULL AND tran_type_id <> 5;

