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
    raise "Error: stack overflow." if size == level

    #alternative is items << item if level !=items
    items.push(item)
  end

  def pop
    raise "Error: stack underflow." if size == 0

    #alternative is items.delete_at(-1)
    items.pop
  end
end