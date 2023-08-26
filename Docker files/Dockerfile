FROM bitnami/dotnet-sdk:7.0.400-debian-11-r15
LABEL author = "shiva"
LABEL director = "somanath"
LABEL camera = "thiru"
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.2/nopCommerce_4.60.2_NoSource_linux_x64.zip /somanath/
WORKDIR /somanath
RUN apt update && apt install unzip -y && \
    unzip nopCommerce_4.60.2_NoSource_linux_x64.zip && \
    mkdir /somanath/bin && mkdir /somanath/logs
EXPOSE 5000
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
CMD ["dotnet","Nop.Web.dll"]