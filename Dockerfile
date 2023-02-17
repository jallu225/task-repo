FROM ubuntu
USER root
RUN mkdir /home/test/
CMD [ "sh", "-c", "ps -ex | tee /home/test/sample.txt && top -c -b -n 1 | tee -a /home/test/sample.txt"] 
