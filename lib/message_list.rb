class MessageTable
  def initialize(database_connection)
    @database_connection = database_connection
  end

  def create(username, message)
    insert_user_sql = <<-SQL
      INSERT INTO users (username, password)
      VALUES ('#{username}', '#{message}')
      RETURNING id
    SQL

    @database_connection.sql(insert_user_sql).first["id"]
  end
end
