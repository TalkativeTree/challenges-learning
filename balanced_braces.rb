# Balanced Braces: Given a string of opening and closing parentheses, check whether it’s balanced. We have 3 types of parentheses: round brackets: (), square brackets: [], and curly brackets: {}. Assume that the string doesn’t contain any other character than these, no spaces words or numbers. Just to remind, balanced parentheses require every opening parenthesis to be closed in the reverse order opened. For example ‘([])’ is balanced but ‘([)]‘ is not.

require "minitest/autorun"
class Brace
  TYPES = ["{}", "()", "[]"]
  MISMATCHES = ["[)","[}","{]","{)","(}", "(]"]
  OPEN_SIDES = ["{", "(", "["]
  CLOSED_SIDES = ["}", ")", "]"]

  attr_reader :expression

  def initialize(expression)
    @expression = expression
  end

  def balanced?
    equal_num? && mismatches.empty? && !open_end? ? 1 : 0
  end

  private
  def equal_num?
    expression.count("(") == expression.count(")") &&
    expression.count("{") == expression.count("}") &&
    expression.count("[") == expression.count("]")
  end

  def mismatches
    MISMATCHES.select{|mismatch| expression.include?(mismatch)}
  end

  def open_end?
    CLOSED_SIDES.include?(expression[0]) || OPEN_SIDES.include?(expression[-1])
  end
end

class BraceCollection
  def initialize(braces)
    @braces = braces.map{|brace_parts| Brace.new(brace_parts)}
  end

  def check_balance
    @braces.map{|brace| brace.balanced? }
  end
end

def check_braces(expressions)
  braces = BraceCollection.new(expressions)
  braces.check_balance
end

class TestBraces < Minitest::Test
  def setup
    @braces = [")(){}","[]({})","([])","{()[]}","([)]", "{(}{)({{(}{}{)}{}{)({})})}})})}", "{((()))[]}", "{", ")", "{sdasdafa[]}", "{sad)}"]
    @results = [0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0]
  end

  def test_check_braces
    assert_equal @results, check_braces(@braces)
  end
end