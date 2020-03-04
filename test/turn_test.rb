require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn1 = Turn.new("Paris", @card)
    @turn2 = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn1
  end

  def test_it_has_a_guess
    assert_equal "Paris", @1turn.guess
  end

  def test_it_has_a_card
    assert_instance_of Card, @turn1.card
  end

  def test_it_returns_correct_boolean_if_the_guess_isCorrect?
    assert_equal false, @turn1.isCorrect?
    assert_equal true, @turn2.isCorrect?
  end

  def test_it_returns_correct_feedback_based_on_if_guess_isCorrect?
    assert_equal "Incorrect!", @turn1.feedback
    assert_equal "Correct!", @turn2.feedback
  end
end