LOAD DATA LOCAL INFILE 'C:/Users/sande/Downloads/ADBMS Project/branches.csv' INTO TABLE bank.branch
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@ID,@Name, @Location,@Manager)
SET branch_name=@Name, location=@Location,manager=@Manager;

LOAD DATA LOCAL INFILE 'C:/Users/sande/Downloads/ADBMS Project/clients.csv' INTO TABLE bank.client
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@ID,@First_Name,@Last_name,@DOB,@Age,@Sex,@Street,@City,@Province,@Zipcode,@Created_Time,
@Contact_no,@Work_no)
SET first_name = @First_Name,
    last_name = @Last_name,
    DOB = STR_TO_DATE(@DOB,'%m/%d/%Y'),
    age = @Age,
    sex = @Sex,
    street = @Street,
    city = @City,
    province = @Province,
    zipcode = @Zipcode,
    created_time = STR_TO_DATE(@Created_Time, '%m/%d/%Y %H:%i'),
    contact_no = @Contact_no,
    work_no = @Work_no;


INSERT INTO account_type (account_type, description) VALUES 
("Savings Account", "A basic account for storing money and earning interest. It's suitable for individuals looking to save money over time."),
("Student Account", "Geared towards students, these accounts often have reduced fees and are designed to help students manage their finances during their educational years."),
("Online Banking Account", "These accounts are primarily accessed online, offering the convenience of managing finances through digital channels."),
("Health Savings Account (HSA)", "A tax-advantaged account used in conjunction with a high-deductible health insurance plan to save for medical expenses."),
("Business Account", "Tailored for businesses, this type of account offers features like business check writing, merchant services, and various business-specific tools."),
("Certificate of Deposit (CD)", "A time-bound savings account with a fixed interest rate and maturity date. Funds are locked for a specified period, and withdrawing before maturity may result in penalties."),
("Money Market Account", "Similar to a savings account but often offers higher interest rates. It may require a higher minimum balance and provides limited check-writing privileges."),
("Checking Account", "Also known as a current account, this is used for everyday transactions. It provides features like writing checks, making debit card transactions, and online bill payments."),
("Trust Account", "Managed by a trustee for the benefit of a beneficiary. These are often used for estate planning or managing assets for someone who can't do so themselves."),
("Custodial Account", "Managed by an adult on behalf of a minor or someone who is unable to manage their finances.");

INSERT INTO transaction_type (transaction_type, description, transaction_fee) 
VALUES 
('ATM Withdrawal', 'Using an ATM to withdraw cash.', 2.00),
('Overdraft fees', 'If your account balance goes below zero.', 5.00),
('ATM Deposit', 'Adding funds to an account, often in the form of cash, checks, or electronic transfers.', 1.00),
('Transfer', 'Moving funds from one account to another, either within the same bank or between different banks.', 1.00),
('Balance Inquiry', 'Checking the available balance in an account, often done through ATM transactions or online banking.', 0.00);


SET @@sql_mode := CONCAT_WS(',', @@sql_mode, 'NO_ZERO_DATE,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION');

LOAD DATA LOCAL INFILE 'C:/Users/sande/Downloads/ADBMS Project/Account.csv' INTO TABLE bank.account
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@ID, @Balance_account, @STATUS, @Created_at, @Deleted_at, @Client_ID, @account_type_id, @Branch_ID)
SET 
    balance_account = @Balance_account, 
    status = @STATUS, 
    created_at = STR_TO_DATE(@Created_at, '%Y-%m-%d %H:%i:%s'),  -- Use the correct date format
    deleted_at = STR_TO_DATE(@Deleted_at, '%Y-%m-%d %H:%i:%s'),  -- Use the correct date format
    client_id = @Client_ID,
    account_type_id = @account_type_id,
    branch_id = @Branch_ID;


INSERT INTO transaction ( transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 201.00, '2023-08-30 16:16:00', NULL, 4, 1, 2);

INSERT INTO transaction ( transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 31.00, '2023-08-30 16:17:00', NULL, 4, 5, 6);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 341.00, '2023-08-30 16:18:00', NULL, 4, 6, 8);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 311.00, '2023-08-30 16:19:00', NULL, 4, 8, 1);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 41.00, '2023-08-30 16:19:00', NULL, 4, 1, 5);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 501.00, '2023-08-30 16:19:00', NULL, 4, 1, 9);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 31.00, '2023-08-30 16:19:00', NULL, 4, 2, 4);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 34.00, '2023-08-30 16:19:00', NULL, 4, 14, 13);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 311.00, '2023-08-30 16:19:00', NULL, 4, 4, 1);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 404.00, '2023-08-30 16:19:00', NULL, 4, 1, 6);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 51.00, '2023-08-30 16:19:00', NULL, 4, 1, 9);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 331.00, '2023-08-30 16:19:00', NULL, 4, 2, 4);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 390.00, '2023-08-30 16:19:00', NULL, 4, 14, 13);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 311.00, '2023-08-30 16:26:00', NULL, 4, 4, 5);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 311.00, '2023-08-30 16:27:00', NULL, 3, 4, 5);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 311.00, '2023-08-30 16:32:00', NULL, 3, 4, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 311.00, '2023-08-30 16:33:00', NULL, 3, 4, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 11.00, '2023-08-30 16:33:00', NULL, 3, 6, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 411.00, '2023-08-30 16:33:00', NULL, 3, 14, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 106.00, '2023-08-30 16:33:00', NULL, 3, 4, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 111.00, '2023-08-30 16:33:00', NULL, 3, 5, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 11.00, '2023-08-30 16:34:00', NULL, 3, 7, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 411.00, '2023-08-30 16:34:00', NULL, 3, 8, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 106.00, '2023-08-30 16:34:00', NULL, 3, 9, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 111.00, '2023-08-30 16:34:00', NULL, 3, 10, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 12.00, '2023-08-30 16:36:00', NULL, 1, 7, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 412.00, '2023-08-30 16:36:00', NULL, 1, 8, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 107.00, '2023-08-30 16:36:00', NULL, 1, 9, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 112.00, '2023-08-30 16:36:00', NULL, 1, 10, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 0.00, '2023-08-30 16:38:00', 220.00, 5, 7, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 0.00, '2023-08-30 16:38:00', 256.00, 5, 8, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 0.00, '2023-08-30 16:38:00', 1340.00, 5, 9, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 0.00, '2023-08-30 16:38:00', 545.00, 5, 10, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 0.00, '2023-08-31 21:11:00', 444.00, 5, 11, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 0.00, '2023-08-31 21:11:00', 345.00, 5, 12, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 0.00, '2023-08-31 21:11:00', 6424.00, 5, 13, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 0.00, '2023-08-31 21:11:00', 5419.00, 5, 14, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 721.00, '2023-09-06 21:34:00', NULL, 1, 5, NULL);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 100.00, '2023-09-06 21:40:00', NULL, 4, 4, 2);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( 101.00, '2023-09-06 21:56:00', NULL, 4, 5, 2);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( NULL, '2023-09-06 21:58:00', NULL, 4, 1, 2);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( NULL, '2023-09-06 22:00:00', NULL, 4, 1, 2);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( NULL, '2023-09-06 22:06:00', NULL, 4, 1, 2);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( NULL, '2023-09-06 22:07:00', NULL, 4, 1, 2);

INSERT INTO transaction (  transaction_amount, date_of_transaction, total_balance, tran_type_id, source_account_id, destination_account_id)
VALUES ( NULL, '2023-09-06 22:11:00', NULL, 4, 1, 2);

SHOW WARNINGS;