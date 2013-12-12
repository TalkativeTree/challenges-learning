module Functions
  module_function

  def puts_string(string)
    puts string
  end
end

class Printer
  include Functions

  def print(string = '')
    printer.invoke(self, string)
  end

  def printer
    Function.new(:puts_string)
  end

end

class Function
  def initialize(method, options = {})
    @handler_method = method
    @options = options
  end

  def invoke(putter, string)
    putter.send(@handler_method, string)
  end
end
