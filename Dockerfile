FROM gradle:alpine AS gradle-python-pygments
USER root
RUN apk add --no-cache python2 py-pip ruby ruby-dev
RUN pip install pygments
RUN gem install --no-ri --no-rdoc asciidoctor pygments.rb coderay
WORKDIR /usr/src/playground
RUN chown -R gradle.gradle /usr/src/playground
#USER gradle
VOLUME ["/root/.gradle"]
COPY build.gradle /usr/src/playground
COPY src/templates /usr/src/playground/src/templates
#RUN chown -R gradle.gradle /usr/src/playground
RUN mkdir src/content
RUN gradle bake
COPY . .
RUN gradle bake

FROM nginx:latest
WORKDIR /usr/share/nginx/html
VOLUME ["/usr/share/nginx/html"]
COPY --from=gradle-python-pygments /usr/src/playground/build/output .
