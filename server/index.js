import pg from 'pg';

const { Client } = pg;

const client = new Client({
  connectionString: 'postgres://root:root@localhost:5432/live025',
});

await client.connect();

const res = await client.query(`
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
WHERE cus.id = 9
GROUP BY cus.id
`);

console.log(res.rows[0]);

await client.end();
