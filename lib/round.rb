require './lib/turn'

class Round
  attr_reader :deck
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def turns
    @turns
  end

  def current_card
    @current_card = @deck.cards[@turns.length]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    @turns.select{ |turn| turn.isCorrect? }.length
  end

  def number_correct_by_category(category)
    @turns.select { |turn| turn.card.category == category }.length
  end

  def percent_correct
    Float(number_correct) / deck.cards.length * 100
  end

  def percent_correct_by_category(category)
    Float(number_correct_by_category(category)) / deck.cards.length * 100
  end
end