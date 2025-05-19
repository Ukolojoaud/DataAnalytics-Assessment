use adashi_staging;
-- Question 4: For each customer, assuming the profit_per_transaction is 0.1% of the transaction value, calculate: 
-- ● Account tenure (months since signup) 
-- ● Total transactions 
-- ● Estimated CLV (Assume: CLV = (total_transactions / tenure) * 12 * 
-- avg_profit_per_transaction) 
-- ● Order by estimated CLV from highest to lowest 

SELECT  
    u.id AS customer_id,  
    CONCAT(u.first_name, ' ', u.last_name) AS name,  
    TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,  
    COUNT(s.id) AS total_transactions,  
    ROUND(  
        (COUNT(s.id) / NULLIF(TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()), 0))  
        * 12  
        * (0.001 * AVG(s.confirmed_amount))  
    , 2) AS estimated_clv  
FROM users_customuser u  
LEFT JOIN savings_savingsaccount s  
    ON u.id = s.owner_id  
GROUP BY u.id, CONCAT(u.first_name, ' ', u.last_name), u.date_joined  
HAVING COUNT(s.id) > 0  
ORDER BY estimated_clv DESC;