CREATE
OR REPLACEFUNCTIONSCRUB_EMAIL(email_address VARCHAR(255))RETURNSVARCHAR(255)AS$$SELECT
  CONCAT(
    SUBSTR(
      MD5(RANDOM()::TEXT),
      0,
      GREATEST(
        LENGTH(SPLIT_PART(email_address, '@', 1)) + 1,
        6
      )
    ),
    '@',
    SPLIT_PART(email_address, '@', 2)
  )$$LANGUAGESQL;
SELECT
  SETSEED(0.5);
SELECT
  SCRUB_EMAIL(email)
FROM
  users
LIMIT 5;
