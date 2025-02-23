SELECT 
    customer_id, 
    SUM(amount) AS total_spent,
    COUNT(transaction_id) AS total_purchases,
    CASE 
        WHEN SUM(amount) > 1000 THEN 'High Spender'
        WHEN COUNT(transaction_id) > 5 THEN 'Frequent Buyer'
        ELSE 'Occasional Buyer'
    END AS customer_segment
FROM transactions
GROUP BY customer_id;
