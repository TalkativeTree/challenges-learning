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


end