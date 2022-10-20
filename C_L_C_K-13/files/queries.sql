CREATE TABLE IF NOT EXISTS local_posts
(
    id Int64,
    title String,
    description String,
    content String,
    user_id Int64,
    date Date
)
ENGINE = MergeTree()
PARTITION BY date
ORDER BY id;
CREATE DICTIONARY IF NOT EXISTS local_users_dict
(
  user_id UInt64 DEFAULT 0,
  email String
)
PRIMARY KEY user_id
SOURCE(FILE(path '/var/lib/clickhouse/user_files/users.csv' format 'CSV'))
LAYOUT(FLAT())
LIFETIME(30)