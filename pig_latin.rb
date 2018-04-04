#Need to refactor word_starting_with_two_consonants duplication

class PigLatin

  def initialize(word)
    @word = word
  end

  def word_to_letters
    @word.split("")
  end

  def word_starting_with_vowel
    @word + "ay"
  end

  def word_starting_with_consonant
    new_word = []
    word_to_letters.each do |letter|
      new_word = word_to_letters.rotate
    end
    new_word.join + "ay"
  end

  def word_starting_with_two_consonants
    new_word = []
    word_to_letters.each do |letter|
      new_word = word_to_letters.rotate(2)
    end
    new_word.join + "ay"
  end

  def translate
    if @word[0] =~ /[aeiou]/
      word_starting_with_vowel
    elsif (@word[0] !~ /[aeiou]/) && (@word[1] !~ /[aeiou]/)
      word_starting_with_two_consonants
    else
      word_starting_with_consonant
    end
  end

end