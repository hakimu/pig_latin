# For words that begin with constonant sounds all letters before the initial vowel are placed at the end of the word sequence.  Then "ay" is added.
# "pig" = "igpay"
# "latin" = "atinlay"
# "trash" = "ashtray"
# "happy" = "appyhay"

# For words that begin with vowel sounds, add "ay" to the end of the sound.
# "eat" = "eatay"
# "egg" = "eggay"
# "omelet" = "omeletay"
# consonant

require 'minitest/autorun'
require 'minitest/rg'
require_relative 'pig_latin'

class PigLatinTest < Minitest::Test

  def setup
    @pig = PigLatin.new("pig")
    @latin = PigLatin.new("latin")
    @trash = PigLatin.new("trash")
    @happy = PigLatin.new("happy")

    @eat = PigLatin.new("eat")
    @egg = PigLatin.new("egg")
    @omelet = PigLatin.new("omelet")

    @expected_pig = "igpay"
    @expected_latin = "atinlay"
    @expected_trash = "ashtray"
    @expected_happy = "appyhay"

    @expected_eat = "eatay"
    @expected_egg = "eggay"
    @expected_omelet = "omeletay"
  end

  def test_multiple_words
    assert_equal @expected_pig, @pig.translate
    assert_equal @expected_latin, @latin.translate
    assert_equal @expected_trash, @trash.translate
    assert_equal @expected_happy, @happy.translate

    assert_equal @expected_eat, @eat.translate
    assert_equal @expected_egg, @egg.translate
    assert_equal @expected_omelet, @omelet.translate
  end

  def test_word_to_letters
    word = PigLatin.new("pig")
    expected = ["p","i","g"]
    assert_equal expected, word.word_to_letters
  end

  def test_word_starting_with_vowel
    assert_equal @expected_eat, @eat.word_starting_with_vowel
    assert_equal @expected_egg, @egg.word_starting_with_vowel
    assert_equal @expected_omelet, @omelet.word_starting_with_vowel
  end

  def test_check_each_letter_starting_with_consonant
    expected_pig = "igpay"
    expected_latin = "atinlay"
    assert_equal expected_pig, @pig.word_starting_with_consonant 
    assert_equal expected_latin, @latin.word_starting_with_consonant     
  end

  def test_back_to_back_consonants
    friend = PigLatin.new("friend")
    expected_friend = "iendfray"
    
    assert_equal @expected_trash, @trash.word_starting_with_two_consonants
    assert_equal expected_friend, friend.word_starting_with_two_consonants
  end

end