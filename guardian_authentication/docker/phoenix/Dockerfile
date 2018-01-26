FROM elixir:1.6.0

MAINTAINER Hugo Benício <hbobenicio@gmail.com>

# "Cria" um usuário phoenix (comandos subsequentes utilizarão este home de usuário, ao invés de /root/.mix, por exemplo)
RUN useradd -ms /bin/bash phoenix
USER phoenix
WORKDIR /home/phoenix

# Updates Hex
RUN mix local.hex --force

# Install the Phoenix archive
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

# Updates Rebar (really needed?)
RUN mix local.rebar --force

CMD /bin/bash
