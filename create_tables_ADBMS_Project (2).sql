-- using bank database to create tables
USE bank;

-- creating branch table 
CREATE TABLE branch (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    manager VARCHAR(50) NOT NULL
);

-- creating client table with all possible client details
CREATE TABLE client (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    age INT,
    sex CHAR(1) NOT NULL,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    zipcode VARCHAR(10) NOT NULL,
    created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    contact_no VARCHAR(20) NOT NULL,
    work_no VARCHAR(20)
);

-- creating account_type table storing multiple types of accounts
CREATE TABLE account_type (
    account_type_id INT PRIMARY KEY AUTO_INCREMENT,
    account_type VARCHAR(50) NOT NULL,
    description TEXT NOT NULL
);

-- creating account table with foreign keys referencing branch,client and account type 
CREATE TABLE account (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    balance_account DECIMAL(15,2),
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    client_id INT NOT NULL,
    account_type_id INT NOT NULL,
    branch_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES client(client_id),
    FOREIGN KEY (account_type_id) REFERENCES account_type(account_type_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

-- create transaction type table storing types of transactions
CREATE TABLE transaction_type (
    tran_type_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_type VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    transaction_fee DECIMAL(8,2) NOT NULL
);

-- creating transaction table which stores transaction details with foreign key references transaction type_id,
-- source account id and destination account id
CREATE TABLE transaction (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_amount DECIMAL(15,2),
    date_of_transaction TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_balance DECIMAL(15,2),
    tran_type_id INT NOT NULL,
    source_account_id INT NOT NULL,
    destination_account_id INT,
    FOREIGN KEY (tran_type_id) REFERENCES transaction_type(tran_type_id),
    FOREIGN KEY (source_account_id) REFERENCES account(account_id),
    FOREIGN KEY (destination_account_id) REFERENCES account(account_id)
);
