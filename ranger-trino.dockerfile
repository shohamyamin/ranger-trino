FROM channwl/ranger:latest
WORKDIR /root


RUN wget  https://github.com/aakashnand/trino-ranger-demo/releases/download/trino-ranger-demo-v1.0/ranger-3.0.0-SNAPSHOT-trino-plugin-405-406.tar.gz -O trino-plugin
RUN mkdir /opt/ranger/ranger-3.0.0-SNAPSHOT-admin/ews/webapp/WEB-INF/classes/ranger-plugins/trino && \
    mv trino-plugin /opt/ranger/ranger-3.0.0-SNAPSHOT-admin/ews/webapp/WEB-INF/classes/ranger-plugins/trino/ranger-trino-plugin-3.0.0-SNAPSHOT.jar
ADD https://github.com/aakashnand/trino-ranger-demo/releases/download/trino-ranger-demo-v1.0/ranger-2.1.0-admin.tar.gz /root