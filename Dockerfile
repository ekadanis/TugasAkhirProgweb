FROM php:8.2-cli

# Install dependencies and PostgreSQL extension
RUN apt-get update
RUN apt-get install -y libpq-dev
RUN docker-php-ext-install pgsql pdo_pgsql

WORKDIR /app

# Copy application files
COPY . .

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/app"]
