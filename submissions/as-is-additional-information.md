# Candidates for Automation

## high-volume

create or receive work-list
check legacy database
check emails
check spreadsheet
contact customer
capture delinquent outcome
capture next steps
schedule follow-up

## repeatable

create or receive work-list
check legacy database
check emails
check spreadsheet
contact customer
managers reconcile status
schedule follow-up

## rules-driven

check legacy database
check emails
check spreadsheet
contact customer
capture delinquent outcome
capture next steps
managers reconcile status
schedule follow-up

## lower-risk

check legacy database
check emails
check spreadsheet
contact customer
schedule follow-up

## Conclusion

Based on the above check legacy database, check emails, check spreadsheet, contact 
customer, schedule follow-up are the most suitable for automation, and capture 
delinquent outcome, capture next steps, managers reconcile status are somewhat
likely candidates.

# Automation Details

## Opportunities

- self-serve portal api can make requests to legacy database to check status of
    client.
- self-serve portal api can make requests to spreadsheets to check status of clients.
- self serve portal can scrape business emails to confirm a customer exists.
- self-serve portal can automatically send sms or email reminders to customer if 
    their associated delinquent account reaches certain thresholds (time, 
    amount etc.)
- once portal detects that a case is complete (customer gets to end of service),
    it can automatically schedule a follow-up
- follow-ups that require human intervention can be dealt with using employee calendar
    data.
- instead of managers reconciling manual statuses, customers who use the self-serve
    portal can have their statuses updated live on it. The managers can use this
    instead for reporting.

## Risks

- customer interaction process should remain agent-led (complexity, judgement)
- managers reconciling statements should remain manager-led (risk, judgement)
- creating/ receiving work-list should remain agent-led (judgement)
