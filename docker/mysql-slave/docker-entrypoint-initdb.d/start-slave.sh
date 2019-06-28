#!/bin/bash

mysql -u root -h mysql-master -e "RESET MASTER;"
mysql -u root -h mysql-master -e "FLUSH TABLES WITH READ LOCK;"

mysql -u root -e "STOP SLAVE;"
mysqldump -u root -h mysql-master --all-databases --master-data --single-transaction --flush-logs --events | mysql -u root


log_file=`mysql -u root -h mysql-master -e "SHOW MASTER STATUS\G" | grep File: | awk '{print $2}'`
pos=`mysql -u root -h mysql-master -e "SHOW MASTER STATUS\G" | grep Position: | awk '{print $2}'`

mysql -u root -e "RESET SLAVE;"
mysql -u root -v <<SQL
    CHANGE MASTER TO
        MASTER_HOST='mysql-master',
        MASTER_USER='root',
        MASTER_PASSWORD='',
        MASTER_LOG_FILE='${log_file}',
        MASTER_LOG_POS=${pos},
        MASTER_DELAY=10;
SQL
mysql -u root -e "START SLAVE;"

mysql -u root -h mysql-master -e "UNLOCK TABLES;"
