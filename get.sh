#!/bin/bash
acv=$(netstat -plunat | grep ":$1 " | awk '{print $7}' | awk 'BEGIN{FS="/"} {print $1}' | uniq | grep [1-9])
if [ $? -eq 0 ];then
	ls -al /proc/$acv | grep exe | awk '{print $11}'
else
    	echo "OFF"
fi

#挑战：查看使用端口程序



