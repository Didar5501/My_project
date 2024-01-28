CREATE TABLE users (
    UserID SERIAL PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL
);


CREATE TABLE actionAudit (
    AuditID SERIAL PRIMARY KEY,
    UserID INT,
    ActionID INT,
    Sign CHAR(1),
    OperationID INT,
    OperDate DATE,
    ContractID INT,
    AmountTypeID INT,
    ActionTypeID INT,
    PaymentTypeID INT,
    IssueDate DATE,
    RepaymentDate DATE,
    IsOutBalance BOOLEAN,
    AmountLocalCur DECIMAL(10, 2),
    AmountForeignCur DECIMAL(10, 2),
    AuditDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    procedureAudID INT,
    CONSTRAINT fk_actionAudit_procedureAud
    FOREIGN KEY (procedureAudID)
    REFERENCES procedureAud (procedureAudID)
);


CREATE TABLE operationAudit (
    AuditID SERIAL PRIMARY KEY,
    UserID INT,
    OperationID INT,
    Type VARCHAR(255),
    Version INT,
    OperDate DATE,
    TimeInMillis BIGINT,
    ContractID INT,
    DocumentID INT,
    AmountTypeID INT,
    ActionTypeID INT,
    PaymentTypeID INT,
    IsOutBalance BOOLEAN,
    FundTransactionID INT,
    TotalLocalCur DECIMAL(10, 2),
    TotalForeignCur DECIMAL(10, 2),
    RealDate DATE,
    IsAutoAccept BOOLEAN,
    CollateralID INT,
    CollateralActionTypeID INT,
    StoringPlaceID INT,
    AuditDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE trancheAudit (
    AuditID SERIAL PRIMARY KEY,
    TrancheID INT,
    UserID INT,
    Version INT,
    ScheduleID INT,
    IssueDate DATE,
    RepaymentDate DATE,
    Principal DECIMAL(10, 2),
    Interest DECIMAL(10, 2),
    IsLgot CHAR(1),
    AuditDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    procedureAudID INT,
    CONSTRAINT fk_trancheAudit_procedureAud
    FOREIGN KEY (procedureAudID)
    REFERENCES procedureAud (procedureAudID)
);


CREATE TABLE procedureAud (
    procedureAudID SERIAL PRIMARY KEY,
    UserID INT,
    ContractID INT,
    ProcedureName VARCHAR(255),
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);