DO $$
BEGIN
  IF NOT EXISTS (
     SELECT *
     FROM   pg_catalog.pg_user
     WHERE  usename = 'glitchr') THEN

     CREATE ROLE glitchr LOGIN PASSWORD 'password';
     ALTER USER glitchr CREATEDB;
   END IF;
END
$$;
