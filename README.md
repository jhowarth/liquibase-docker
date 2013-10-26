Run a docker container that acts as a liquibase command line interface.

Postgres example:

```
docker run -v /vagrant/liquibase:/liquibase -t jhowarth/liquibase \
   --classpath=/drivers/postgresql-9.2-1003.jdbc4.jar \
   --changeLogFile=/liquibase/changes/changeLog.xml \
   --driver=org.postgresql.Driver \
   --username=user \
   --password=password \
   --url=jdbc:postgresql://host:port/db \
   update
```
