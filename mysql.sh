echo disable mysql
dnf module disable mysql -y >>/tmp/expense.log

cp mysql.repo /etc/yum.repos.d/mysql.repo

echo installing MySql
dnf install mysql-community-server -y >>/tmp/expense.log

echo statingmysqld services
systemctl enable mysqld >>/tmp/expense.log
systemctl restart mysqld >>/tmp/expense.log

echo password
mysql_secure_installation --set-root-pass ExpenseApp@1 >>/tmp/expense.log

echo changing user
mysql -uroot -pExpenseApp@1 >>/tmp/expense.log