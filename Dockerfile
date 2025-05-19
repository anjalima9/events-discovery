FROM ruby:3.2.2

# Installer les dépendances système
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  default-libmysqlclient-dev \
  default-mysql-client \
  nodejs \
  libvips42 \
  libvips-dev \ 
  && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn

# Définir le répertoire de travail
WORKDIR /app

# Installer bundler
ENV BUNDLER_VERSION=2.4.22
RUN gem install bundler -v "$BUNDLER_VERSION"

# Copier les fichiers nécessaires pour l'installation des gems
COPY Gemfile Gemfile.lock ./

# Installer les gems
RUN bundle install

# Copier le reste du code de l'application
COPY . .

# Précompiler les assets (optionnel en dev)
# RUN bundle exec rake assets:precompile

# Exposer le port 3000
EXPOSE 3000

# (tout le reste comme avant...)

# Copier le script d’entrée
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Redéfinir le point d’entrée
ENTRYPOINT ["/usr/bin/entrypoint.sh"]