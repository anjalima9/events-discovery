#!/bin/bash
set -e

echo "📡 Vérification de la base de données MySQL..."
echo "Database connection parameters:"
echo "Host: $DB_HOST"
echo "User: $DB_USER"
echo "Password: [hidden]"
echo "Database: $DATABASE_NAME"


# More verbose mysql connection attempt
until mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PWD" -e "SELECT 1;" 2>&1; do
  echo "⏳ En attente de MySQL à $DB_HOST..."
  sleep 2
done

echo "✅ MySQL est prêt !"

# Add SSL_MODE=disabled for MySQL connection
export RAILS_DATABASE_SSL_MODE=disabled

# Lancer la création et les migrations
echo "🛠️ Préparation de la base de données (create + migrate)..."
bundle exec rails db:prepare

# ✅ Build des assets
echo "🎨 Compilation des assets (JavaScript, CSS, etc.)..."
bundle exec rake assets:precompile

# ✅ Créer le dossier manquant
mkdir -p tmp/pids

# Lancement de Puma
echo "🚀 Lancement de Puma..."
exec bundle exec puma -C config/puma.rb