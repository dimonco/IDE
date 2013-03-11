#!/bin/bash
if gcc c/hello.c -o c/c_app 2>> report.txt;
	then echo "C"; #git commit -a -m 'C Success';
fi
if g++ -o cpp/output cpp/hello.cpp 2>> report.txt;
	then echo "C++"; #git commit -a -m 'C++ Success';
fi
#if javac java/hello.java 2>> report.txt;
#	then echo "Java"; #git commit -a -m 'Java Success';
#fi
echo '===Output of the results==='
c/c_app
cpp/output
java -cp java hello
if python python/hello.py 2>> report.txt;
	then echo "Python"; #git commit -a -m 'Python Success';
fi
if ruby ruby/hello.rb 2>> report.txt;
	then echo "Ruby"; #git commit -a -m 'Ruby Success';
fi
cat report.txt | msmtp --host=smtp.gmail.com --port=587 --protocol=smtp --auth=on --user=dima.cotet@@gmail.com --tls=on --tls-starttls=on --tls-trust-file=/etc/ssl/certs/ca-certificates.crt -f dima.cotet@gmail.com -t dima.cotet@gmail.com
