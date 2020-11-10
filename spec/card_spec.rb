require 'spec_helper'
require 'card'


RSpec.describe 'a credit card' do
  it 'has a card number' do
    new_card = Card.new("1234567890")
    expect(new_card.card_number).to eq("1234567890") 
  end
end
