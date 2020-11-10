require "spec_helper"
require "card"


RSpec.describe "a credit card" do
  it "has a card number" do
    new_card = Card.new("1234567890")
    expect(new_card.card_number).to eq("1234567890") 
  end

  context "valid cards" do

    it "validates visa card" do
      new_card = Card.new("4242424242424242")
      expect(new_card.card_valid).to be true
    end


  end
end
