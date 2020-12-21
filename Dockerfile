ADD file:25f61d70254b9807a40cd3e8d820f6a5ec0e1e596de04e325f6a33810393e95a in /
CMD ["/bin/sh"]
ENV LANG=C.UTF-8
/bin/sh -c { 		echo '#!/bin/sh'; 		echo 'set -e'; 		echo; 		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; 	} > /usr/local/bin/docker-java-home 	&& chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin
ENV JAVA_VERSION=8u171
ENV JAVA_ALPINE_VERSION=8.171.11-r0
/bin/sh -c set -x 	&& apk add --no-cache 		openjdk8="$JAVA_ALPINE_VERSION" 	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]
/bin/sh -c apk add --no-cache curl tar bash procps
ARG MAVEN_VERSION=3.5.4
ARG USER_HOME_DIR=/root
ARG SHA=ce50b1c91364cb77efe3776f756a6d92b76d9038b0a0782f7d53acf1e997a14d
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/3.5.4/binaries MAVEN_VERSION=3.5.4 SHA=ce50b1c91364cb77efe3776f756a6d92b76d9038b0a0782f7d53acf1e997a14d USER_HOME_DIR=/root /bin/sh -c mkdir -p /usr/share/maven /usr/share/maven/ref   && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz   && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c -   && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1   && rm -f /tmp/apache-maven.tar.gz   && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME=/usr/share/maven
ENV MAVEN_CONFIG=/root/.m2
COPY file:fb726a12bbbf8ff54c8d9fceef4fa3018c11a435bfa04ee5f73156c544907861 in /usr/local/bin/mvn-entrypoint.sh
COPY file:b3fc14e8337e0079a4e97eace880b4b7cddc0dc0ea733de80749f78fe1eb089a in /usr/share/maven/ref/
CMD ["mvn"]
/bin/sh -c mkdir -p /usr/src/app &&     cd /usr/src/app &&     wget https://bitbucket.org/art-uniroma2/vocbench3/downloads/vocbench3-4.0.2_full.zip &&     unzip ./vocbench3-4.0.2_full.zip &&     rm ./vocbench3-4.0.2_full.zip
WORKDIR /usr/src/app/semanticturkey-4.0.2
/bin/sh -c sed -i 's/org\.osgi\.service\.http\.port=1979/org\.osgi\.service\.http\.port=80/' etc/org.ops4j.pax.web.cfg &&     mkdir deploy/tmp &&     unzip -q deploy/vocbench3-4.0.2.war -d deploy/tmp/ &&     cd deploy/tmp &&     sed -i 's/var st_port = "1979";/var st_port = "80";/' vbconfig.js &&     jar -cf 'vocbench3-4.0.2.war' * &&     cd ../ &&     mv -f tmp/vocbench3-4.0.2.war ./ &&     rm -rf tmp &&     cd .. &&     chmod +x bin/karaf
CMD ["bin/karaf"]
EXPOSE 80
