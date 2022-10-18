CREATE TABLE IF NOT EXISTS ch_local
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
CREATE TABLE IF NOT EXISTS ch_distributed
(
    id Int64,
    title String,
    description String,
    content String,
    date Date
)
ENGINE = Distributed('local', 'default', 'ch_local', rand());