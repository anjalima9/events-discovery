#!/bin/bash
set -e

echo "📡 Vérification de la base de données MySQL..."

# Boucle jusqu’à ce que la base de données soit prête
until mysql -h"$DATABASE_HOST" -u"$DATABASE_USERNAME" -p"$DATABASE_PASSWORD" -e "SELECT 1;" > /dev/null 2>&1; do
  echo "⏳ En attente de MySQL à $DATABASE_HOST..."
  sleep 2
done

echo "✅ MySQL est prêt !"

# Lancer la création et les migrations (prepare = create + migrate + schema:load si nécessaire)
echo "🛠️ Préparation de la base de données (create + migrate)..."
bundle exec rails db:prepare

# Lancer le serveur Rails
echo "🚀 Lancement de Puma..."
exec bundle exec puma -C config/puma.rb
