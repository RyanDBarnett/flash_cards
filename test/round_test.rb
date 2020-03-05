require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'

class RoundTest < Minitest::Test

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
    @deck = Deck.new([@card1, @card2])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert_instance_of Deck, @round.deck
  end

  def test_it_has_a_current_card
    assert_equal @round.current_card, @card1
  end

  def test_it_can_take_turn 
    turn = @round.take_turn('Juneau')

    assert_instance_of Turn, turn
    assert_equal true, turn.isCorrect?
    assert_equal 1, @round.turns.length
  end

  def test_the_current_card_has_changed
    turn = @round.take_turn('Juneau')
    
    assert_equal @card2, @round.current_card
  end

  def test_it_can_return_the_number_of_correct_turns
    turn1 = @round.take_turn('Juneau')

    assert_equal 1, @round.number_correct

    turn2 = @round.take_turn('Wrong')

    assert_equal 1, @round.number_correct
  end

  def test_it_can_return_the_number_of_correct_answers_by_category
    turn = @round.take_turn('Juneau')

    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_it_can_return_percentage_of_correct_answers
    turn = @round.take_turn('Juneau')

    assert_equal 50.0, @round.percent_correct
  end

  def test_it_can_return_percentage_of_correct_answers_by_category
    turn = @round.take_turn('Juneau')
    
    assert_equal 50.0, @round.percent_correct_by_category(:Geography)
  end
end