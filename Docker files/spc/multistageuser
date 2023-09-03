FROM alpine/git AS vcs
RUN mkdir spc \
    cd /spc && \
    git clone https://github.com/spring-projects/spring-petclinic.git /spc && \
    pwd && ls
    
FROM maven:3.9.4-amazoncorretto-17 AS builder
COPY --from=vcs /spc /spc
RUN ls /spc
RUN cd /spc && mvn package


FROM openjdk:17-alpine
LABEL author="somaath",director="boaz"
ARG HOME_DIR=/qtwork
WORKDIR ${HOME_DIR}
ARG user=thirumala
ARG group=thirumala
ARG uid=1000
ARG gid=1000
RUN adduser -h ${HOME_DIR} -s /bin/sh -D -u  ${uid} ${user} && \
    chown ${user}:${group} ${HOME_DIR}
USER ${user}
COPY --from=builder /spc/target/spring-*.jar ${HOME_DIR}/spring-*.jar
EXPOSE 8080
CMD ["java","-jar","spring-*.jar"]


