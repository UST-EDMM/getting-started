FROM library/ubuntu:bionic
ENV PRIV_KEY_PATH=./files/ubuntu/key.pem
ENV OS_FAMILY=linux
ENV MACHINE_IMAGE=ubuntu
ENV INSTANCE_TYPE=large
ENV PORT=8080
WORKDIR /opt/pet_clinic
ADD ./openstack.json openstack.json
ADD ./petclinic.war petclinic.war
ADD ./pet_clinic_tomcat_create.sh pet_clinic_tomcat_create.sh
ADD ./pet_clinic_configure.sh pet_clinic_configure.sh
ADD ./pet_clinic_tomcat_start.sh pet_clinic_tomcat_start.sh
RUN chmod +x pet_clinic_tomcat_create.sh && \
    ./pet_clinic_tomcat_create.sh && \
    chmod +x pet_clinic_configure.sh && \
    ./pet_clinic_configure.sh
EXPOSE 8080
RUN chmod +x pet_clinic_tomcat_start.sh
CMD ["./pet_clinic_tomcat_start.sh"]

