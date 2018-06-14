FROM bitwalker/alpine-elixir:1.6.4

# Set exposed ports
EXPOSE 8000
ENV PORT=8000
ENV MIX_ENV=prod

COPY . .
RUN \
			mix do deps.get, deps.compile && \
			mix do compile, release --verbose --env=prod && \
			mkdir -p /opt/guardian_authentication/log && \
			cp _build/prod/rel/guardian_authentication/releases/0.0.1/guardian_authentication.tar.gz /opt/guardian_authentication/ && \
			cd /opt/guardian_authentication && \
			tar -xzf guardian_authentication.tar.gz && \
			rm guardian_authentication.tar.gz && \
			chmod -R 777 /opt/guardian_authentication
#		rm -rf /opt/guardian_authentication/* && \
#											chmod -R 777 /opt/app && \
#											chmod -R 777 /opt/myapp

WORKDIR /opt/guardian_authentication

CMD ./bin/guardian_authentication foreground

#COPY _build/prod/rel/guardian_authentication/releases/0.0.1/guardian_authentication.tar.gz ./
#RUN tar -xzvf guardian_authentication.tar.gz

#USER default

#CMD ./bin/guardian_authentication foreground
