class Card
  attr_reader :card_number

  AMEX_LENGTH = [15, 17]
  AMEX_VALID_CHAR_IDXS = [4, 11]
  VISA_LENGTH = [16, 19]
  VISA_VALID_CHAR_IDXS = [4, 9, 14]
  VALID_CHARS = [" ", "-"]

  def initialize(card_number)
    @card_number = card_number
  end

  def card_valid
    card_number_array = card_number.split("")

    if card_number[0] == "3"
      parse_card(card_number_array, AMEX_LENGTH, AMEX_VALID_CHAR_IDXS)
    elsif card_number[0] == "4"
      parse_card(card_number_array, VISA_LENGTH, VISA_VALID_CHAR_IDXS)
    else
      return false
    end
  end

  def parse_card(card_number_array, card_length, valid_char_idxs)
    if card_number_array.length == card_length[0]
      return true
    elsif card_number_array.length == card_length[1]
      valid_hashes(card_number_array, valid_char_idxs)
    else
      return false
    end
  end

  def valid_hashes(card_number_array, valid_char_idxs)
    valid_char_idxs.each do |idx|
      if !VALID_CHARS.include?(card_number_array[idx]) 
        return false
      end
    end
    return true
  end
end
