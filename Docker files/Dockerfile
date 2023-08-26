FROM bitnami/dotnet-sdk:7.0.400-debian-11-r15
ARG user=nopCommerce
ARG group=nopCommerce
ARG uid=1000
ARG gid=1000 
USER ${user}
ARG HOME_DIR=/somanath
WORKDIR ${HOME_DIR}
RUN groupadd -g ${gid} ${group} &&\
    useradd -d ${HOME_DIR} -u ${uid} -g ${gid} -m -s /bin/bash ${user}
# LABEL author = "shiva" director = "somanath" camera = "thiru"
# ARG DOWNLOAD_URL=https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.2/nopCommerce_4.60.2_NoSource_linux_x64.zip
# ADD --chown=${user}:${group} ${DOWNLOAD_URL} ${HOME_DIR}
# RUN apt update && apt install unzip -y && \
#     unzip ${HOME_DIR}/nopCommerce_4.60.2_NoSource_linux_x64.zip && \
#     mkdir ${HOME_DIR}/bin && mkdir ${HOME_DIR}/logs
# EXPOSE 5000
# ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
# CMD ["dotnet","Nop.Web.dll"]
