require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
    deck = Deck.new([card1, card2])

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
    deck = Deck.new([card1, card2])

    assert_equal deck.cards, [card1, card2]
  end

  def test_it_has_card_count
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
    deck = Deck.new([card1, card2])

    assert_equal deck.count, 2
  end

  def test_it_returns_cards_from_specific_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
    card3 = Card.new("Who was the first president of the US?", "George Washington", :History)
    deck = Deck.new([card1, card2, card3])

    assert_equal deck.cards_in_category(:Geography), [card1, card2]
    assert_equal deck.cards_in_category(:History), [card3]
  end
end