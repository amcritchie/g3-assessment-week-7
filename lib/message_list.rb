class MessageTable
  def initialize(database_connection)
    @database_connection = database_connection
  end

  def create(username, message)
    insert_user_sql = <<-SQL
      INSERT INTO message_table (name, message)
      VALUES ('#{username}', '#{message}')
    SQL

    @database_connection.sql(insert_user_sql)
  end

  def messages
    users_sql = <<-SQL
      SELECT name, message FROM message_table
    SQL

    @database_connection.sql(users_sql)
  end

end
