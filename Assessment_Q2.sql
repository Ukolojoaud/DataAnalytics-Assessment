use adashi_staging;
-- Question 2:Calculate the average number of transactions per customer per month and 
-- categorize them: 
-- ● "High Frequency" (≥10 transactions/month) 
-- ● "Medium Frequency" (3-9 transactions/month) 
-- ● "Low Frequency" (≤2 transactions/month) 

SELECT 
    savings_category,
    COUNT(customer_id) AS customer_count,
    AVG(savings_count) AS avg_transaction_per_month
FROM (
    SELECT  
        users_customuser.id AS customer_id,
        COUNT(savings_savingsaccount.savings_id) AS savings_count,
        CASE 
            WHEN COUNT(savings_savingsaccount.savings_id) >= 10 THEN 'High Frequency'
            WHEN COUNT(savings_savingsaccount.savings_id) >= 3 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS savings_category  -- Assigning savings category based on transaction frequency
    FROM users_customuser
    JOIN savings_savingsaccount  
    ON users_customuser.id = savings_savingsaccount.owner_id
    GROUP BY users_customuser.id -- Ensuring aggregation happens per customer
) AS categorized_savings
GROUP BY savings_category   -- Aggregating results based on transaction frequency classification
ORDER BY avg_transaction_per_month DESC;  -- Sorting categories by highest average transactions per month