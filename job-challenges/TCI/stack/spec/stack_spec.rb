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

    it "doesn't insert if the array is already full" do
      11.times {|val| stack.push(val)}
      expect(stack.size).to eq(10)
    end
  end

end