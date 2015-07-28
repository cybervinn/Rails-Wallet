require 'test_helper'

class CardTest < ActiveSupport::TestCase
  test "Validating card number by first digit" do
    card = Card.new
    card.number = '111111111111'
    assert !card.save
    assert card.errors.messages.keys.include?(:number)
  end

  test "Validating card number by length" do
    card = Card.new
    card.number = '511111'
    assert !card.save
    assert card.errors.messages.keys.include?(:number)
  end

  test "Adding Card type on creation" do
    card = Card.new
    card.number = '5111111111111111'
    card.expiration_year = 2016
    card.expiration_month = 12
    assert card.save, "Card was not valid"
    card.reload
    assert card.type == 'MasterCard', "Not the right type"
  end
end
