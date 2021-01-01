#!/usr/bin/bash

echo "--設定 1 ----------------------------"
echo -n "local環境で利用したいドメインを入力してください": 
read domain 
sed  -i "" -e  "s/{{localDomainName}}/${domain}/g" ./web/vhost/front.conf 

echo "------------------------------"
echo "---Success:ドメイン名設定完了----"
echo "↓↓↓これをhostsファイルにコピーして貼り付けしてください(一般的には/etc/hostsのファイルを書き換える事で設定できます)"
echo "127.0.0.1 ${domain}　"
echo "------------------------------"


echo "--設定 2 ----------------------------"
echo -n "利用したいdatabase名を入力してください":
read database 

sed  -i "" -e  "s/{{sample_database}}/${database}/g" ./mysql/docker-entrypoint-initdb.d/00_schema_sample.sql
sed  -i "" -e  "s/{{sample_database}}/${database}/g" ./docker-compose.yaml

echo "------------------------------"
echo "-Success:データベース名設定完了  -"
echo "------------------------------"


echo "--設定 3 ----------------------------"
echo -n "adminのパスワードを入力してください":
read sample_mysql_password 
sed  -i "" -e  "s/{{sample_mysql_password}}/${sample_mysql_password}/g" ./docker-compose.yaml

docker-compose up -d 