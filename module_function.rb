require "minitest/autorun"

# Written to learn how the Chronic gem uses handlers and module_function
# to check strings against handler definitions of dates/time and return correct times.
class Function
  def initialize(method, options = {})
    @handler_method = method
    @options = options
  end

  def invoke(putter, string)
    putter.send(@handler_method, string)
  end
end

module Functions
  module_function

  def puts_string(string)
    p string
  end

  def puts_ten(string)
    Array.new(10){string}
  end

  def capitalize(string)
    p string.upcase
  end
end

class Printer
  include Functions

  def print(string = '')
    printer_jobs.map{ |job| job.invoke(self, string) }
  end

  def printer_jobs
    [
      Function.new(:puts_string),
      Function.new(:capitalize),
      Function.new(:puts_ten)
    ]
  end

end

class PrinterTest < Minitest::Test
  def setup
    @printer = Printer.new
    @print_results = ["test this",
                      "TEST THIS",
                      ["test this", "test this", "test this", "test this",
                       "test this", "test this", "test this", "test this",
                       "test this", "test this"]
                      ]
  end

  def test_print
    assert_equal @print_results, Printer.new.print("test this")
  end
end