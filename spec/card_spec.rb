require "spec_helper"
require "card"


RSpec.describe "a credit card" do
  it "has a card number" do
    new_card = Card.new("1234567890")
    expect(new_card.card_number).to eq("1234567890") 
  end

  context "valid visa cards" do

    it "validates visa card" do
      new_card = Card.new("4242-4242-4242-4242")
      expect(new_card.card_valid).to be true
    end

    # it "validates visa card with dashes" do
    #   new_card = Card.new("4242-4242-4242-4242")
    #   expect(new_card.card_valid).to be true
    # end


    # it "validates visa card with spaces" do
    #   new_card = Card.new("4242 4242 4242 4242")
    #   expect(new_card.card_valid).to be true
    # end
  end

  # context "valid amex cards" do

  #   it "validates amex card" do
  #     new_card = Card.new("378282246310005")
  #     expect(new_card.card_valid).to be true
  #   end

  #   it "validates amex card with dashes" do
  #     new_card = Card.new("3782-822463-10005")
  #     expect(new_card.card_valid).to be true
  #   end


  #   it "validates amex card with spaces" do
  #     new_card = Card.new("3782 822463 10005")
  #     expect(new_card.card_valid).to be true
  #   end
  # end

  # context "invalid visa cards" do

  #   it "invalidates visa card" do
  #     new_card = Card.new("j242424242424242")
  #     expect(new_card.card_valid).to be false
  #   end

  #   it "invalidates visa card with dashes" do
  #     new_card = Card.new("4242-42424242-424--2")
  #     expect(new_card.card_valid).to be false
  #   end


  #   it "invalidates visa card with spaces" do
  #     new_card = Card.new("4 242 42424 242 42 42")
  #     expect(new_card.card_valid).to be false
  #   end

  #   it "invalidates visa card with spaces" do
  #     new_card = Card.new("4242 l242 4h42 424k")
  #     expect(new_card.card_valid).to be false
  #   end

  # end

  # context "invalid amex cards" do

  #   it "invalidates amex card" do
  #     new_card = Card.new("k78282246310005")
  #     expect(new_card.card_valid).to be false
  #   end

  #   it "invalidates amex card with dashes" do
  #     new_card = Card.new("3782-82-2463-10005")
  #     expect(new_card.card_valid).to be false
  #   end


  #   it "invalidates amex card with spaces" do
  #     new_card = Card.new("3782 82246 3 100 05")
  #     expect(new_card.card_valid).to be false
  #   end
  # end

end
