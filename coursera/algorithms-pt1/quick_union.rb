class QuickUnion
  attr_accessor :ids

  def initialize(n)
    @ids = Array.new(n){ |id| id }
  end

  def root(n)
    return ids[n] if ids[n] == n
    root(ids[n])
  end

  def connected?(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    i = root(p)
    j = root(q)
    @ids[i] = j
  end
end

require 'rspec'

describe UnionFind do
  let(:uf){ UnionFind.new(10) }

  context "initializes @ids" do
    it "as an array of N elements" do
      expect(uf.ids.length).to eq(10)
    end

    it "in sequential order from 0 to N" do
      expect(uf.ids).to eq([0,1,2,3,4,5,6,7,8,9])
    end
  end

  it "#root finds the root of an id" do
    expect(uf.root(4)).to eq(4)
  end

  it "#connected? returns true if two nodes are connected" do
    expect(uf.connected?(1,1)).to   be_true
  end

  it "#union changes the root of p to the root of q" do
    uf.union(1,2)
    expect(uf.ids).to eq([0,2,2,3,4,5,6,7,8,9])
  end
end