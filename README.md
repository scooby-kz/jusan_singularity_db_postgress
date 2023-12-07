# Репо для задании по БД Postgres от JusanSingularity

## 1.Контейнизируем postgress и pgadmin для дольнейшего удобства
Из интересного чтобы скормить сщуетсвующий дамп БД надо добвать простой скрипт в папку /docker-entrypoint-initdb.d/
```
#!/bin/bash
pg_restore -U postgres -d postgres /dump_2.sql
```