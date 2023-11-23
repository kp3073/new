echo installing Nginx
dnf install nginx -y >/tmp/expense.log


cp expense.conf /etc/nginx/default.d/expense.conf >/tmp/expense.log

echo Removing Old contant of Nginx
rm -rf /usr/share/nginx/html/* >/tmp/expense.log

echo downling the the Files
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >/tmp/expense.log

cd /usr/share/nginx/html

unzip /tmp/frontend.zip >/tmp/expense.log

echo Starting Nginx service
systemctl enable nginx  >/tmp/expense.log
systemctl restart nginx >/tmp/expense.log