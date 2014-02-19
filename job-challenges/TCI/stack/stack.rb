class Stack
  attr_reader :level, :items

  def initialize(level)
    @level  = level
    @items = []
  end

  def size
    items.count
  end

  def push
  end

  def pop
  end
end