FROM alpine:3 As vcs
ARG DOWNLOAD_URL="https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.4/nopCommerce_4.60.4_NoSource_linux_x64.zip"
ADD ${DOWNLOAD_URL} /nopCommerce/nopCommerce_4.60.4_NoSource_linux_x64.zip 
RUN apk update && \
   apk add unzip && \
   cd /nopCommerce && \
   unzip nopCommerce_4.60.4_NoSource_linux_x64.zip && \
   mkdir bin logs && \
   rm nopCommerce_4.60.4_NoSource_linux_x64.zip

 FROM mcr.microsoft.com/dotnet/sdk:7.0
 LABEL donebyy="looser"
 ARG user=nopcommerce
 ARG group=nopcommerce
 ARG uid=1004
 ARG gid=1004
 ARG HOME_DIR=/nopcommerce1
 RUN groupadd -g ${gid} ${group} && \
     useradd -d ${HOME_DIR} -m -s /bin/sh -u ${uid} -g ${gid} ${user}
 USER ${user}
 WORKDIR ${HOME_DIR}
 COPY --chown=${user}:${group} --from=vcs /nopCommerce ${HOME_DIR}
 EXPOSE 5000
 ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
 CMD ["dotnet","Nop.Web.dll"]