require 'pg'

module RPS

  # DATABASE NAME: rps-database

  class ORM

    def initialize
        @db = PG.connect(host: 'localhost', dbname: 'rps-database')
        build_tables
    end

    def build_tables
      # users, games, matches, moves
      command = <<-sQL
        CREATE TABLE IF NOT EXISTS users (
          id SERIAL, 
          username text,
          password text,
          PRIMARY KEY(id))
        sQL
      @db.exec(command)
    end

    def username_exist?(username)
      command = <<-sQL
        SELECT * FROM users WHERE username='#{username}'
        sQL
      result = @db.exec(command)
      if result.ntuples == 0
        false
      else
        true
      end
    end

    def add_user(username, password_digest)
      command = <<-sQL
        INSERT INTO users (username, password) VALUES
        ('#{username}', '#{password_digest}')
        sQL
      @db.exec(command)
    end

    def get_pass(username)
      command = <<-sQL
        SELECT password FROM users WHERE username='#{username}'
        sQL
      result = @db.exec(command)
      if result.ntuples == 0
        false
      else
        result[0]["password"]
      end
    end

    def get_userid(username)
      command = <<-sQL
        SELECT id FROM users WHERE username='#{username}'
        sQL
      result = @db.exec(command)
      result[0]["id"]
    end

  end # class end

  def self.orm
    @__ab_instance ||= ORM.new
  end

end # RPS end