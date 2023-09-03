FROM bitnami/git AS vcs
RUN mkdir express && \
    cd /express && git clone https://github.com/Azure-Samples/js-e2e-express-server.git

FROM node:20-alpine3.17
LABEL author="shiva" project="nodejs" organization="nes"
ARG user=neymar
ARG group=neymar
ARG uid=1002
ARG gid=1002
ARG HOME_DIR=juni
RUN adduser -h ${HOME_DIR} -s /bin/sh -D -u ${uid} ${user}
USER ${user}
COPY --chown=${user}:${group} --from=vcs /express ${HOME_DIR}/
RUN cd ${HOME_DIR}/js-e2e-express-server/ && npm install 
EXPOSE 3000
WORKDIR ${HOME_DIR}/js-e2e-express-server
ENTRYPOINT ["npm"]
CMD ["start"]