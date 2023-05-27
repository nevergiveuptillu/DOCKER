#! /bin/bash

aws rds create-db-instance \
  --db-name 'pracice' \
  --db-instance-indentifier 'practice insta' \
  --allocated-storage 20 \
  --db-instance-class "db.t3.micro" \
  --engine "MYSQL" \
  --master-username "root" \
  --maste-user-password "rootroot" \
  --backup-retention-period 2 \
  --no-multi-az \
  --   

       