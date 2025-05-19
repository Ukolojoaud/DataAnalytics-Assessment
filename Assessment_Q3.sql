use adashi_staging;
-- Question 4:Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days).
SELECT  
    plans_plan.id AS plan_id,  
    savings_savingsaccount.id AS owner_id,  
    plans_plan.description AS plans_type,  
    savings_savingsaccount.transaction_date AS last_transaction_date,  -- Selecting the last transaction date 
    DATEDIFF(CURRENT_DATE, savings_savingsaccount.transaction_date) AS inactivity_days  -- Calculating the number of days since the last transaction 
FROM plans_plan  
JOIN savings_savingsaccount ON plans_plan.id = savings_savingsaccount.id  
GROUP BY plans_plan.id, savings_savingsaccount.id, plans_plan.description, savings_savingsaccount.transaction_date  
HAVING SUM(savings_savingsaccount.confirmed_amount) = 0   -- Filtering for accounts where total confirmed amount is zero
AND SUM(DATEDIFF(CURRENT_DATE, savings_savingsaccount.transaction_date)) >= 365;  -- Filtering accounts that have been inactive for at least a year