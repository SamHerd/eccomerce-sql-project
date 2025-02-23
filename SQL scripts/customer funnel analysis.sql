SELECT COUNT(DISTINCT customer_id) AS added_to_cart,
       COUNT(DISTINCT CASE WHEN action_type = 'Purchase' THEN customer_id END) AS purchased,
       COUNT(DISTINCT customer_id) - COUNT(DISTINCT CASE WHEN action_type = 'Purchase' THEN customer_id END) AS drop_off
FROM cart_actions
WHERE action_type IN ('Add', 'Purchase');
