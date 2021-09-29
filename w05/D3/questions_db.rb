require 'byebug'
require 'singleton'
require 'sqlite3'


class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end



class Users
  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM users')
    data.map { |user| Users.new(user) }
  end


  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    # p id
    user = QuestionsDatabase.instance.execute(<<-SQL, id: id)
    SELECT
      *
    FROM
      users
    WHERE
      id = :id
    SQL
    Users.new(user)
  end

  def self.find_by_name(f, l)
    user = QuestionsDatabase.instance.execute(<<-SQL)
    SELECT
     *
    FROM
      users
    WHERE
      fname = f AND lname = l
    SQL
    Users.new(user)
  end
  
end


class Questions 
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
  end

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


class QuestionFollows
  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end


class Replies
  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @user_id = options['user_id']
    @body = options['body']
  end
end


class QuestionLikes
  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end