-- /docker-entrypoint-initdb.d以下に置いた.sh, .sql, .sql.gzファイルはコンテナ起動時に実行される
CREATE DATABASE database-wn;
CREATE DATABASE test_database-wn;
