CREATE TABLE IF NOT EXISTS ch_replicated_local ON CLUSTER 'local'
(
    id Int64,
    title String,
    description String,
    content String,
    date Date
)
ENGINE = ReplicatedMergeTree('/clickhouse/{cluster}/tables/ch_replicated_local', '{replica}')
PARTITION BY date
ORDER BY id;
CREATE TABLE IF NOT EXISTS ch_replicated_distributed
(
    id Int64,
    title String,
    description String,
    content String,
    date Date
)
ENGINE = Distributed('{cluster}', 'default', 'ch_replicated_local', rand());