class Card
  attr_accessor :card_number, :char_hash

  MAX_SIZE = 19
  AMEX_LENGTH = [15, 17]
  AMEX_VALID_CHAR_IDXS = [4, 11]
  VISA_LENGTH = [16, 19]
  VISA_VALID_CHAR_IDXS = [4, 9, 14]

  def initialize(card_number)
    @card_number = card_number
    @char_hash = {:spaces => 0, :dashes => 0, :nums => []}
  end

  def card_valid
    if card_number.length > MAX_SIZE
      return false, "Card number length exceeds allowed amount."
    else
      create_char_hash
    end
  end

  def create_char_hash
    card_number.each_char do |char|
      if char == " "
        @char_hash[:spaces] += 1
      elsif char == "-"
        @char_hash[:dashes] += 1
      elsif char != "0" && char.to_i == 0
        return false, "Card number includes alpha numeric chars."
      else
        @char_hash[:nums] << char.to_i
      end
    end
    parse_card_data
  end

  def parse_card_data
    if @char_hash[:nums][0] == 3
      verify_char_count(AMEX_LENGTH, AMEX_VALID_CHAR_IDXS)
    elsif @char_hash[:nums][0] == 4
      verify_char_count(VISA_LENGTH, VISA_VALID_CHAR_IDXS)
    else
      return false, "This is not a recognized credit card carrier."
    end
  end


  def verify_char_count(card_length, valid_char_idxs)
    if @char_hash[:nums].length == card_length[0] && @char_hash[:dashes] + @char_hash[:spaces] == 0
      luhn_check
    elsif @char_hash[:nums].length + char_hash[:dashes] == card_length[1] && char_hash[:spaces] == 0
      valid_hashes(valid_char_idxs)
    elsif @char_hash[:nums].length + char_hash[:spaces] == card_length[1] && char_hash[:dashes] == 0
      valid_hashes(valid_char_idxs)
    else
      return false, "The card includes wrong number of dashes or spaces."
    end
  end

  def valid_hashes(valid_char_idxs)
    valid_char_idxs.each_with_index do |char, idx|
      if char == "-" && !valid_char_idxs.include?(idx)
        return false, "The card dashes are in wrong position."
      elsif char == " " && !valid_char_idxs.include?(idx)
        return false, "The card spaces are in wrong position."
      end
    end
    luhn_check
  end

  def luhn_check

    stripped_card_number = @char_hash[:nums]

  # Drop the last digit from the number. The last digit is what we want to check against
    last_num = stripped_card_number.pop

  # Reverse the numbers
    reversed_arr = stripped_card_number.reverse

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
        sum += char
      end
    end
    
    # multiply sum by 9 - missing step in the instructions
    sum *= 9

  # The check digit (the last number of the card) is the amount that you would need to add to get a multiple of 10 (Modulo 10)
    if sum % 10 == last_num
      return true
    else
      return false, "This card didn't pass Luhn check."
    end
  end
end
