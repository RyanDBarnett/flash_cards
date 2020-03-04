class Round
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 'test'
  end

  def deck
    @deck
  end

  def turns
    @turns
  end

  def current_card
    @current_card
  end
end