use adashi_staging;
-- Question 1: Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
 SELECT  
    plans_plan.owner_id,
    CONCAT(users_customuser.first_name, ' ', users_customuser.last_name) AS Name, 
    COUNT(plans_plan.is_regular_savings) AS saving_count,
    COUNT(plans_plan.is_a_fund) AS investment_count,
    SUM(savings_savingsaccount.confirmed_amount) AS tota_deposits
FROM users_customuser
JOIN plans_plan  
ON users_customuser.id = plans_plan.owner_id
JOIN savings_savingsaccount
ON users_customuser.id = savings_savingsaccount.id
GROUP BY plans_plan.owner_id, users_customuser.first_name, users_customuser.last_name
HAVING SUM(savings_savingsaccount.confirmed_amount)>= 1   -- confirmed amount is being Funded
ORDER BY savings_savingsaccount.confirmed_amount DESC;