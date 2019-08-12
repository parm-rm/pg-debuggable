# load debugger library
sed -i -e "s|#shared_preload_libraries = ''|shared_preload_libraries = 'plugin_debugger'|" /var/lib/postgresql/data/postgresql.conf
