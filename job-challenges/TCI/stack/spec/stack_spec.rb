require "rspec"
require_relative "../stack"

describe Stack do

  let(:stack){ Stack.new(10) }

  it "has a #size" do
    expect(stack.method(:size)).to be_true
  end

  it "has a #level" do
    expect(stack.method(:level)).to be_true
  end

  it "has #push" do
    expect(stack.method(:push)).to be_true
  end

  it "has #level" do
    expect(stack.method(:pop)).to be_true
  end

  it "has #items" do
    expect(stack.method(:items)).to be_true
  end

  describe "#push" do
    it "#size equals 0 when no elements are in the stack" do
      expect(stack.size).to eq(0)
    end

    it "inserts a value into items" do
      stack.push(1)
      expect(stack.size).to eq(1)
    end

    it "#size equals the current elements in the stack" do
      5.times { |s| stack.push(s) }
      expect(stack.size).to eq(5)
    end

    it "increments the size by +1" do
      8.times do |val|
        prev_val = stack.size
        stack.push(val)
        expect(stack.size).to eq(prev_val + 1)
      end
    end

    it "pushes items to the end of the stack" do
      8.times{ |val| stack.push(val) }
      expect(stack.items[7]).to eq(7)
    end

    it "raises a Stack overflow error if you try to push into a full stack" do
      10.times{ |val| stack.push(val) }
      expect{ stack.push(11) }.to raise_error("Error: stack overflow.")
    end
  end

  describe "#pop" do
    it "decrements size bt -1" do
      8.times{ |val| stack.push(val) }
      8.times do
        prev_val = stack.size
        stack.pop
        expect(stack.size).to eq(prev_val - 1)
      end
    end

    it "removes the last value from items" do
      8.times{ |val| stack.push(val) }
      expect(stack.pop).to eq(7)
    end

    it "raises a Stack underflow error if you try to push into a full stack" do
      expect{ stack.pop }.to raise_error("Error: stack underflow.")
    end
  end

end