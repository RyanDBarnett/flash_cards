class Turn
  attr_reader :guess, :card
  def initialize(guess, card)   
    @guess = guess
    @card = card
  end

  def isCorrect?
    guess == card.answer
  end

  def feedback
    isCorrect? ? "Correct!" : "Incorrect!"
  end
end