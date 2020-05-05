FROM postgres:11.5-alpine

ARG PLDEBUGGER_COMMIT=ddbce7be9c3ac782ca3369291c1772cbe413cf75

RUN set -ex && \
	apk update && \
	apk add bash gcc git make musl-dev openssl openssl-dev

RUN set -ex && \
	cd / && \
	git clone git://git.postgresql.org/git/pldebugger.git && \
	cd pldebugger && \
	git checkout "$PLDEBUGGER_COMMIT" && \
	USE_PGXS=1 make

RUN set -ex && \
	apk del gcc git musl-dev openssl-dev && \
	rm -r /var/cache/apk/*

RUN set -ex && \
	cd /pldebugger && \
	install -c -m 755 plugin_debugger.so '/usr/local/lib/postgresql/' && \
	install -c -m 644 pldbgapi.control '/usr/local/share/postgresql/extension/' && \
	install -c -m 644 pldbgapi--1.1.sql pldbgapi--unpackaged--1.1.sql '/usr/local/share/postgresql/extension/' && \
	cd / && \
	rm -rf /pldebugger

COPY install-debugger.sh /docker-entrypoint-initdb.d/
