class WordChainer
  DICTIONARY = File.read('fullDictionary.txt').split(/\n+/).product([nil]).to_h
  ALPHA = ('a'..'z').to_a

  def adjacent_words(word)
    set = []
    (0...word.length).each do |i|
      ALPHA.each do |test_letter|
        testable_word = word.dup
        testable_word[i] = test_letter
        set << testable_word if DICTIONARY.include?(testable_word) && testable_word != word
      end
    end
    set
  end  

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }

    while @current_words.length > 0 
      explore_current_words
    end
    build_path(target) + [target]
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |word|
      adjacent_words(word).each do |adjacent_word|
        if !@all_seen_words.include?(adjacent_word)
          new_current_words << adjacent_word
          @all_seen_words[adjacent_word] = word
        end
      end
    end
    # new_current_words.each do |word|
    #   p "#{word} came from #{@all_seen_words[word]}"
    # end
    @current_words = new_current_words
  end

  def build_path(target)
    path = []
    path_word = @all_seen_words[target]
    until path_word == nil
      path << path_word

      path_word = @all_seen_words[path_word]
    end
    path.reverse

  end

end