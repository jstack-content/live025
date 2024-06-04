\c live025


-- DROP INDEX customers_first_name_idx;
-- EXPLAIN ANALYZE VERBOSE SELECT * FROM customers WHERE first_name = 'Customer-10';
-- EXPLAIN ANALYZE VERBOSE SELECT * FROM customers WHERE id = 10;
-- EXPLAIN ANALYZE VERBOSE SELECT * FROM customers WHERE email = 'customer.10@example.com' AND first_name = 'Customer-10';

-- DROP INDEX customers_first_name_idx;
-- CREATE INDEX IF NOT EXISTS customers_first_name_idx ON customers(first_name);
-- CREATE INDEX IF NOT EXISTS customers_last_name_idx ON customers(last_name);

-- SELECT pg_total_relation_size('customers');

-- SELECT * FROM pg_indexes WHERE tablename = 'customers';





-- CREATE INDEX IF NOT EXISTS customers_first_name_idx ON customers(first_name) INCLUDE(id, first_name, last_name);

-- EXPLAIN ANALYZE VERBOSE SELECT * FROM customers WHERE first_name = 'Customer-10';

-- ALTER TABLE customers ADD UNIQUE(first_name);
-- ALTER TABLE customers DROP CONSTRAINT customers_first_name_key;
-- DROP INDEX customers_first_name_key;
EXPLAIN ANALYZE VERBOSE SELECT id, first_name FROM customers WHERE first_name = 'Customer-10';
-- SELECT * FROM pg_indexes WHERE tablename = 'customers';
