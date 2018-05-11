# Mysql

## :bulb: Tips

### Find configuration file MySQL is currently using
`which mysqld`
`/usr/sbin/mysqld --verbose --help | grep -A 1 "Default options"`

### Get current MYSQL version
`SHOW VARIABLES LIKE '%version%';`

### Dealing with "General error: 2006 MySQL server has gone away" error
Check `wait_timeout` & `max_allowed_packet` values. :up: Up the value if necessary

### InnoDB Deadlocks (detect)
`SHOW ENGINE INNODB STATUS;`
