#!/bin/bash

# MySQL credentials
MYSQL_USER="zbx_monitor"
MYSQL_PASSWORD="Password@123"
MYSQL_HOST="localhost"

# Function to retrieve the rate of InnoDB buffer pool read requests per second
get_mysql_innodb_buffer_pool_read_requests_per_sec() {
    # Execute MySQL command to retrieve InnoDB buffer pool read requests
    innodb_buffer_pool_read_requests=$(mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW GLOBAL STATUS LIKE 'Innodb_buffer_pool_read_requests'" 2>/dev/null | awk 'NR==2{print $2}')

    # Print the output in JSON format
    echo "{\"Innodb_buffer_pool_reads\": $innodb_buffer_pool_read_requests}"
}

# Get the rate of InnoDB buffer pool read requests per second
innodb_buffer_pool_reads=$(get_mysql_innodb_buffer_pool_read_requests_per_sec)

# Print the output
echo "$innodb_buffer_pool_reads"
