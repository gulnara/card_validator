class Card
  attr_reader :card_number

  AMEX_LENGTH = [15, 17]
  AMEX_VALID_CHAR_IDXS = [4, 11]
  VISA_LENGTH = [16, 19]
  VISA_VALID_CHAR_IDXS = [4, 9, 14]

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

    luhn_check
  end

  def luhn_check
    card_number_array = card_number.each_char.map(&:to_i)

  # Drop the last digit from the number. The last digit is what we want to check against
    last_num = card_number_array.last

  # Reverse the numbers
    reversed_arr = card_number_array.reverse

  # Multiply the digits in odd positions (1, 3, 5, etc.) by 2 and subtract 9 to all any result higher than 9
  # Add all the numbers together

    sum = 0
    reversed_arr.each_with_index do |char, idx|
      if idx % 2 == 0

        temp = (char * 2)

        if temp > 9
          temp -= 9
        end

        sum += temp
      else
        
      end
    end
    
    # multiply sum by 9 - missing step in the instructions
    sum *= 9

  # The check digit (the last number of the card) is the amount that you would need to add to get a multiple of 10 (Modulo 10)
    if sum % 10 == last_num
      return true
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
    valid_char_idxs.each_with_index do |char, idx|
      if char == "-" && !valid_char_idxs.include?(idx)
        return false
      elsif char == " " && !valid_char_idxs.include?(idx)
        return false
      end
    end
    return true
  end
end
