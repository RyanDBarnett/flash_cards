require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class RoundTest < Minitest::Test

  def test_it_exists
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
    deck = Deck.new([card1, card2])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
    deck = Deck.new([card1, card2])
    round = Round.new(deck)

    assert_instance_of Deck, round.deck
  end

  def test_it_has_a_current_card
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
    deck = Deck.new([card1, card2])
    round = Round.new(deck)

    assert_equal Round.current_card, card1
  end

  def test_it_can_take_turn
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
    deck = Deck.new([card1, card2])
    round = Round.new(deck)
    turn = round.take_turn('Juneau')

    assert_instance_of Turn, turn
  end
end