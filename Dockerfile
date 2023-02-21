FROM ubuntu
RUN cd home && mkdir test
RUN ps -ex > /home/test/sample.txt
RUN top -c -b -n 1 >> /home/test/sample.txt
