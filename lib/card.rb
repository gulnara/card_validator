class Card

  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def card_valid
    card_number_array = card_number.split("")

    if card_number[0] == "3"
      validate_amex(card_number_array)
    elsif card_number[0] == "4"
      validate_visa(card_number_array)
    else
      return false
    end
  end

  def validate_visa(card_number_array)
    if card_number_array.length == 16
      return true
    elsif card_number_array.length == 19
      valid_idxs = [4, 9, 14]
      valid_hashes(card_number_array, valid_idxs)
    else
      return false
    end
  end

  def valid_hashes(card_number_array, valid_idxs)
    card_number_array.each_with_index do |char, idx|
      if char == "-" && !valid_idxs.include?(idx)
        return false
      elsif char == " " && !valid_idxs.include?(idx)
        return false
      end
    end
    return true
  end


end