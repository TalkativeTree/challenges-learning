require 'minitest/autorun'
class CreditCard
  def initialize(card_number)
    @card_number = CreditCardNumber.new(card_number)
  end

  def authentic_number?
    @card_number.authentic?
  end
end

class CreditCardNumber
  attr_reader :digits
  def initialize(digits)
    @digits = digits
  end

  def authentic?
    right_length? && right_numbers?
  end

  private
  def right_length?
    @digits.length == 16
  end

  def right_numbers?
    @digits.split('').map{|digit| digit.to_i}.inject{|sum, digit| sum+digit} % 10 == 0
  end
end

class TestCardNumber < Minitest::Test
  def setup
    @valid_number = "5555555555555555"
    @invalid_number = "111111111111"
  end

  def test_authentic
    c = CreditCard.new(@valid_number)
    i = CreditCard.new(@invalid_number)

    assert_equal true, c.authentic_number?
    assert_equal false, i.authentic_number?
  end
end