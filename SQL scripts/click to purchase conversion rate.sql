SELECT 
    COUNT(DISTINCT page_views.session_id) AS total_sessions,
    COUNT(DISTINCT CASE WHEN clicked_cta = 1 THEN page_views.session_id END) AS clicked_cta,
    COUNT(DISTINCT transactions.customer_id) AS purchased,
    (COUNT(DISTINCT transactions.customer_id) * 100.0 / COUNT(DISTINCT page_views.session_id)) AS conversion_rate
FROM page_views
LEFT JOIN transactions ON page_views.session_id = transactions.customer_id;
