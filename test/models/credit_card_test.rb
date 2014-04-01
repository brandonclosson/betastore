require 'test_helper'

class CreditCardTest < ActiveSupport::TestCase

  test "it should save" do
    credit_card = customers(:brandon).credit_cards.build(card_number: '4111111111111111', expiration_date: '03/2017')
    assert credit_card.save, credit_card.errors.full_messages.join(', ')
  end

  test "it should not save without card number" do
    credit_card = customers(:brandon).credit_cards.build(expiration_date: '03/2017')
    refute credit_card.save
    assert_equal ["can't be blank"],
      credit_card.errors[:card_number]
  end

end