class Card

  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def card_valid
    return false
  end
end