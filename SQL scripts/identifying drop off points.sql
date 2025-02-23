SELECT page_id, 
       AVG(time_spent) AS avg_time_spent, 
       COUNT(session_id) AS total_sessions, 
       SUM(CASE WHEN clicked_cta = 1 THEN 1 ELSE 0 END) AS checkout_clicks
FROM page_views
GROUP BY page_id
ORDER BY avg_time_spent DESC;
