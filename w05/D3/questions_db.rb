require 'singleton'
require 'sqlite3'


class QuestionsDatabase << SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Questions 
  def self.find(id)
    question = QuestionsDatabase.instance.execute(<<-SQL)
    SELECT 
    *
    FROM
    questions 
    WHERE
    id = ?
    SQL

  end
end