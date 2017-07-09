FROM frekele/gradle:4.0-jdk8u131
#USER root
#RUN apk add --no-cache python2 py-pip ruby ruby-dev
RUN apt-get update && apt-get install -y \
  python \
  python-pip \
  ruby \
  ruby-dev
RUN pip install pygments
RUN gem install --no-ri --no-rdoc asciidoctor pygments.rb coderay
VOLUME ["/jbake-adoc/"]
CMD gradle bake --continuous
