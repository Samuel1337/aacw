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
  attr_reader :id, :fname, :lname

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
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      users
    WHERE
      id = ?
    SQL
    Users.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT
     *
    FROM
      users
    WHERE
      fname = ? AND lname = ?
    SQL
    Users.new(user.first)
  end

  def authored_questions
    Questions.find_by_author_id(@id)
  end

  def authored_replies
    Replies.find_by_user_id(@id)
  end

  # def self.authored_questions(fname, lname) #wrong
  #   author_id = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
  #     SELECT
  #       id
  #     FROM
  #       users
  #     WHERE
  #       fname = ? AND lname = ?
  #   SQL
  #   arr_hash = Questions.find_by_author_id(author_id.first['id'])
  #   arr_hash.map { |hash| hash["body"] }
  # end

  # def self.authored_replies(fname, lname) #wrong
  #   user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
  #     SELECT
  #       id
  #     FROM
  #       users
  #     WHERE
  #       fname = ? AND lname = ?
  #   SQL
  #   arr_hash = Replies.find_by_user_id(user.first['id'])
  #   arr_hash.map { |hash| hash['body'] }
  # end
  
end


class Questions 
  
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author 
    Users.find_by_id(@author_id)
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT
      *
    FROM
      questions
    WHERE
      author_id = ?
    SQL
    question.map { |h| Questions.new(h) }
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM
      questions 
    WHERE
      id = ?
    SQL
    Questions.new(question.first)
  end

  def replies
    Replies.find_by_question_id(@id)
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
  attr_reader :author_id
  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    replies.map { |hash| Replies.new(hash) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    replies.map { |hash| Replies.new(hash) }
  end

  def author
    Users.find_by_id(@user_id)
  end

  def question
    Questions.find_by_id(@id)
  end

  def parent_reply
    Replies.find_by_user_id(@parent_reply_id)
  end


end


class QuestionLikes
  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end