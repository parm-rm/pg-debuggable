# Postgresql Debuggable Image

This image includes `pldebugger` extension.

## Installing debugger

No steps required. `postgresql.conf` is automatically updated during container start to load `pldebugger`.

## Enabling debugger

Use to following command to enable debugger for a database.

```sql
CREATE EXTENSION pldbgapi;
```

## [How to debug?](https://www.pgadmin.org/docs/pgadmin4/latest/debugger.html)

Ignore "modify the postgresql.conf file" part.
