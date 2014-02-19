class Stack
  attr_reader :level, :items

  def initialize(level)
    @level  = level
    @items = []
  end

  def size
    items.count
  end

  def push(item)
    items.push(item) if level != items.count
  end

  def pop
  end
end