\c live025

-- INSERT INTO orders(customer_id, amount) VALUES(10, 199.95);
-- INSERT INTO orders(amount) VALUES(99);
-- DELETE FROM orders WHERE customer_id = 9;

-- Aggregate

SELECT
  cus.*,
  NO_EMPTY_OBJECT_ARRAY(
    COUNT(ord.id),
    JSON_AGG(
      JSON_STRIP_NULLS(
        JSON_BUILD_OBJECT(
          'id', ord.id,
          'amount', ord.amount
        )
      )
    )
  ) AS orders
FROM customers AS cus
LEFT JOIN orders AS ord ON ord.customer_id = cus.id
WHERE cus.id = 10
GROUP BY cus.id
;

-- LEFT
-- INNER
-- RIGHT
-- FULL
-- CROSS