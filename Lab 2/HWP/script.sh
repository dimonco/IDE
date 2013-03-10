#!/bin/bash
if gcc c/hello.c -o c/c_app 2>> report.txt;
	then git commit -m 'C Success';
fi
if g++ -o cpp/output cpp/hello.cpp 2>> report.txt;
	then git commit -m 'C++ Success';
fi
if javac java/hello.java 2>> report.txt;
	then git commit -m 'Java Success';
fi
echo '===Output of the results==='
c/c_app
cpp/output
java -cp java hello
if python python/hello.py 2>> report.txt;
	then git commit -m 'Python Success';
fi
if ruby ruby/hello.rb 2>> report.txt;
	then git commit -m 'Ruby Success';
fi
cat raport.txt | msmtp --host=smtp.mail.ru --port=465 --protocol=smtp --auth=on --user=dimon_co@mail.ru --tsl==on --tsl-trust-file=/etc/ssl/certs/ca-certificates.crt -f dimon_co@mail.ru -t dimon_co@mail.ru
rm report.txt
