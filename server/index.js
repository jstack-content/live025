import pg from 'pg';

const { Client } = pg;

const client = new Client({
  connectionString: 'postgres://root:root@localhost:5432/live025',
});

await client.connect();

const res = await client.query(`
  SELECT * FROM customers_summary
`);

console.log(res.rows);

await client.end();
