echo Disable Nodjs Old
dnf module disable nodejs -y >>/tmp/expense.log

echo Re-install Nodjs
dnf module enable nodejs:18 -y >>/tmp/expense.log

echo Download Nodjs Depandensis
dnf install nodejs -y >>/tmp/expense.log

cp backend.service /etc/systemd/system/backend.service

echo adding user
useradd expense >>/tmp/expense.log

mkdir /app

echo downloading backend Contant
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >>/tmp/expense.log
cd /app

echo Unziping file
unzip /tmp/backend.zip >>/tmp/expense.log

echo NPM install
cd /app
npm install >>/tmp/expense.log

echo starting service
systemctl daemon-reload >>/tmp/expense.log

systemctl enable backend>>/tmp/expense.log
systemctl start backend >>/tmp/expense.log

echo install mysql
dnf install mysql -y >>/tmp/expense.log

mysql -h 172.31.38.222 -uroot -pExpenseApp@1 < /app/schema/backend.sql >>/tmp/expense.log