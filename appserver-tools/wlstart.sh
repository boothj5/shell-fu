#!/bin/sh

wls_folder=/home/james/wlsdomain/base_domain
jdbc_folder=$wls_folder/config/jdbc

export JAVA_OPTIONS="-Dframework.database=$1 -Djava.security.auth.login.config=/home/james/wlconfig/jaas.config -Dframework.switchOnFullTextSearch=false -Dframework.log.dir=/home/james/log/wl -Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,address=4000,server=y,suspend=n -javaagent:/home/james/wlsdomain/base_domain/lib/aspectjweaver.jar"

ln -sf ${jdbc_folder}/${1}DS.txt ${jdbc_folder}/OracleDS-0429-jdbc.xml
${wls_folder}/startWebLogic.sh
