CREATE DATABASE IF NOT EXISTS db;
CREATE TABLE IF NOT EXISTS db.local_data
(
    id Int64,
    title String,
    description String,
    content String,
    date Date
)
ENGINE = MergeTree()
PARTITION BY date
ORDER BY id;
CREATE DATABASE IF NOT EXISTS db_restore;