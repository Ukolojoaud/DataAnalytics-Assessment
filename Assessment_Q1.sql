use adashi_staging;
-- Question 1: Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
 SELECT  
    plans_plan.owner_id,
    CONCAT(users_customuser.first_name, ' ', users_customuser.last_name) AS Name,  -- Combining first and last name of the user
    COUNT(plans_plan.is_regular_savings) AS saving_count,  -- Counting the number of regular savings plans per user
    COUNT(plans_plan.is_a_fund) AS investment_count,    -- Counting the number of investment funds per user
    SUM(savings_savingsaccount.confirmed_amount) AS tota_deposits  -- Summing up the confirmed deposits from savings accounts
FROM users_customuser
JOIN plans_plan  
ON users_customuser.id = plans_plan.owner_id  -- Joining plans with users based on the owner ID
JOIN savings_savingsaccount
ON users_customuser.id = savings_savingsaccount.id  -- Joining savings accounts with users based on user ID
GROUP BY plans_plan.owner_id, users_customuser.first_name, users_customuser.last_name
HAVING SUM(savings_savingsaccount.confirmed_amount)>= 1   -- Filtering out users with no confirmed deposits (only funded accounts)
ORDER BY savings_savingsaccount.confirmed_amount DESC;  -- Sorting results by total confirmed deposits in descending order