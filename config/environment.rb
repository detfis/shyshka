require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/shyshka'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/shyshka_development.sqlite3'
    #    adapter :sql, 'postgres://localhost/shyshka_development'
    #    adapter :sql, 'mysql://localhost/shyshka_development'
    #
    adapter :sql, ENV['DATABASE_URL']

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/shyshka/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
      # production :smtp, address: ENV['SMTP_PORT'], port: 1025
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :info
  end

  environment :test do
    logger level: :info, stream: "log/test.log"
  end

  environment :production do
    logger level: :info, formatter: :json

    mailer do
      delivery :smtp, address: ENV['SMTP_HOST'], port: ENV['SMTP_PORT']
    end
  end  
end
