CREATE DATABASE glitchr_test;
DO $$
BEGIN
  IF NOT EXISTS (
     SELECT *
     FROM   pg_catalog.pg_user
     WHERE  usename = 'glitchr') THEN

     CREATE ROLE glitchr LOGIN PASSWORD 'password';
   END IF;
END
$$;
GRANT ALL PRIVILEGES ON DATABASE glitchr_test TO glitchr;
