class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
      @secret_word = Hangman.random_word
      newArr = []
      @secret_word.length.times do 
        newArr << '_'
      end
      @guess_word = newArr
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
      if attempted_chars.include?(char)
        return true
      else
        return false
      end
  end

  def get_matching_indices(char)
      newArr = []
      @secret_word.each_char.with_index do |char2, i|
        if char2 == char
          newArr << i
        end
      end
      return newArr
  end

  def fill_indices(char, array)
      array.each do |i|
        @guess_word[i] = char
      end
  end

  def try_guess(char)
    if self.already_attempted?(char)
       print 'that has already been attempted'
       return false
    else
       @attempted_chars << char  
    end
    self.fill_indices(char, self.get_matching_indices(char))
    if self.get_matching_indices(char).empty?
        @remaining_incorrect_guesses -= 1
    end
    return true
  end

  def ask_user_for_guess
    print 'Enter a char:'
    input = gets.chomp
    return self.try_guess(input)
  end

  def win?
      if @guess_word.join("") == @secret_word
         print 'WIN'
         return true
      else
         return false
      end
  end

  def lose?
      if @remaining_incorrect_guesses == 0
         print 'LOSE'
         return true
      else
        return false
      end
  end

  def game_over?
      if self.win?
         print @secret_word
         return true
      elsif self.lose?
          print @secret_word
          return true
      else
        return false
      end
    end

  


end
