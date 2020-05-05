require 'pg'
require_relative 'spec_helper'

class Setup

  def setup_test_database
p "Setting up test database..."

connection = PG.connect(dbname: 'bookmark_manager_test')

connection.exec("TRUNCATE bookmarks;")
 end
end 
