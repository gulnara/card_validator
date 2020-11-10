require "spec_helper"
require "card"


RSpec.describe "a credit card" do
  it "has a card number" do
    new_card = Card.new("1234567890")
    expect(new_card.card_number).to eq("1234567890") 
  end

  context "valid visa cards" do

    it "validates visa card" do
      new_card = Card.new("4242424242424242")
      expect(new_card.card_valid).to be true
    end

    it "validates visa card with dashes" do
      new_card = Card.new("4242-4242-4242-4242")
      expect(new_card.card_valid).to be true
    end


    it "validates visa card with spaces" do
      new_card = Card.new("4242 4242 4242 4242")
      expect(new_card.card_valid).to be true
    end

    it "validates visa card" do
      new_card = Card.new("4242424242424242")
      expect(new_card.card_valid).to be true
    end
  end

  context "valid amex cards" do

    it "validates amex card" do
      new_card = Card.new("378282246310005")
      expect(new_card.card_valid).to be true
    end

    it "validates amex card with dashes" do
      new_card = Card.new("3782-822463-10005")
      expect(new_card.card_valid).to be true
    end


    it "validates amex card with spaces" do
      new_card = Card.new("3782 822463 10005")
      expect(new_card.card_valid).to be true
    end
  end

end
