FROM registry.access.redhat.com/ubi8/ubi
 

WORKDIR /app 
RUN dnf -y  module install nodejs:16/common  
RUN dnf -y install npm jq   
RUN dnf -y install git


RUN git clone https://github.com/openshift/hac-dev.git /app 
RUN npm install --legacy-peer-deps
RUN npm install --save-dev webpack --legacy-peer-deps    

RUN echo "127.0.0.1 prod.foo.redhat.com stage.foo.redhat.com qa.foo.redhat.com ci.foo.redhat.com" >>/etc/hosts
 
EXPOSE 1337  
CMD [ "npm" ,"run", "start:prod:beta"]

