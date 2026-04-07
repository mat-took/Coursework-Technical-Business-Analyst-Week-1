DROP DATABASE legacy_trust_bank;

CREATE DATABASE legacy_trust_bank;

\c legacy_trust_bank;

-- 1. Table for Delinquent Accounts
DROP TABLE IF EXISTS delinquent_accounts;

CREATE TABLE delinquent_accounts (
    account_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    customer_name VARCHAR(100), -- NEW: Added to match your data
    product_type VARCHAR(50),
    delinquency_stage VARCHAR(20),
    days_past_due INTEGER,
    overdue_amount NUMERIC(12, 2),
    total_balance NUMERIC(12, 2),
    risk_flag CHAR(1),
    current_status VARCHAR(50),
    customer_email VARCHAR(100),
    customer_mobile VARCHAR(11),
    customer_postcode VARCHAR(10),
    last_contact TEXT,
    self_service_candidate BOOLEAN,
    created_date DATE 
);

\copy delinquent_accounts FROM 'data/aws/delinquent_accounts_export.csv' WITH (FORMAT csv, HEADER true);

SET datestyle = 'ISO, DMY';

-- 2. Table for Finance Assumptions
DROP TABLE IF EXISTS finance_assumptions;

CREATE TABLE finance_assumptions (
    assumption_id VARCHAR(10) PRIMARY KEY,
    assumption_name VARCHAR(100),
    total_value NUMERIC(15, 4),
    unit VARCHAR(20),
    source VARCHAR(100),
    confidence_level VARCHAR(20),
    notes TEXT
);

\copy finance_assumptions FROM 'data/aws/finance_assumptions.csv' WITH (FORMAT csv, HEADER true);

-- 3. Table for Recovery Activity Tracker
DROP TABLE IF EXISTS recovery_activity_tracker;

CREATE TABLE recovery_activity_tracker (
    activity_id VARCHAR(20),
    account_id VARCHAR(20),
    activity_date DATE,
    activity_type VARCHAR(50),
    performed_by VARCHAR(50),
    source_system VARCHAR(50),
    outcome_code VARCHAR(50),
    next_follow_up_date DATE,
    minutes_spent INTEGER,
    duplicate_check_flag CHAR(1)
);

\copy recovery_activity_tracker FROM 'data/aws/recovery_activity_tracker.csv' WITH (FORMAT csv, HEADER true);

-- 4. Table for Stakeholder Interview Notes
DROP TABLE IF EXISTS stakeholder_interview_notes;

CREATE TABLE stakeholder_interview_notes (
    note_id VARCHAR(10) PRIMARY KEY,
    stakeholder_name VARCHAR(100),
    stakeholder_role VARCHAR(100),
    theme VARCHAR(50),
    quote_or_observation TEXT,
    impact_area VARCHAR(100),
    confidence_level VARCHAR(20)
);

\copy stakeholder_interview_notes FROM 'data/aws/stakeholder_interview_notes.csv' WITH (FORMAT csv, HEADER true);

-- 5. Table for Customer Journey Events
DROP TABLE IF EXISTS customer_journey_events;

CREATE TABLE customer_journey_events (
    activity_id VARCHAR(20),
    journey_id VARCHAR(20),
    account_id VARCHAR(20),
    event_timestamp TIMESTAMP,
    event_step VARCHAR(100),
    event_status VARCHAR(50),
    selected_action VARCHAR(100),
    channel_source VARCHAR(50),
    risk_band VARCHAR(20),
    eligibility_result VARCHAR(50)
);

\copy customer_journey_events FROM 'data/aws/smart_recovery_portal_events.csv' WITH (FORMAT csv, HEADER true);