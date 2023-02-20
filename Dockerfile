FROM ubuntu
RUN cd home && mkdir test
RUN ps -ex > /home/test/sample.txt
RUN top -c >> /home/test/sample.txt
