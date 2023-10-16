FROM trinodb/trino:405
USER root
RUN mkdir -p /usr/lib/trino data/trino && chown -R "trino:trino" /usr/lib/trino data/trino
RUN useradd trino-ranger-test -l -G 0,trino -u 1000770000
RUN chmod -R g+w /data/trino/
COPY ./ranger-3.0.0-SNAPSHOT-trino-plugin-405-406.tar.gz /root/ranger-3.0.0-SNAPSHOT-trino-plugin-405-406.tar.gz
COPY ./ranger-3.0.0-SNAPSHOT-trino-plugin-405-406.tar.gz /home/trino/ranger-3.0.0-SNAPSHOT-trino-plugin-405-406.tar.gz
COPY ./install.properties /home/trino/ranger-3.0.0-SNAPSHOT-trino-plugin/install.properties
COPY ./enable-trino-plugin.sh /home/trino/ranger-3.0.0-SNAPSHOT-trino-plugin/enable-trino-plugin.sh
RUN cd /root && tar xvf ranger-3.0.0-SNAPSHOT-trino-plugin-405-406.tar.gz && yes| cp /home/trino/ranger-3.0.0-SNAPSHOT-trino-plugin/* ranger-3.0.0-SNAPSHOT-trino-plugin/ && chown root:root -R /root/ranger-3.0.0-SNAPSHOT-trino-plugin/*
RUN chmod -R 777 /root/ranger-3.0.0-SNAPSHOT-trino-plugin/enable-trino-plugin.sh
RUN chmod -R 777 /usr/lib/trino/bin/run-trino
CMD ["/root/ranger-3.0.0-SNAPSHOT-trino-plugin/enable-trino-plugin.sh && /usr/lib/trino/bin/run-trino"]
#entrypoint: bash -c " cd /root && curl https://github.com/aakashnand/trino-ranger-demo/releases/download/trino-ranger-demo-v2.1.0/ranger-2.1.0-trino-plugin.tar.gz --output ranger-2.1.0-trino-plugin.tar.gz -L  && tar xvf ranger-2.1.0-trino-plugin.tar.gz && yes| cp /home/trino/ranger-2.1.0-trino-plugin/* ranger-2.1.0-trino-plugin/ && chown root:root -R /root/ranger-2.1.0-trino-plugin/* && /root/ranger-2.1.0-trino-plugin/enable-trino-plugin.sh && /usr/lib/trino/bin/run-trino "