require 'minitest/autorun'
require_relative '../../magical_tree'

describe MagicalTree::Tree do

  let(:example) do
    [[3],
     [7, 4],
     [2, 4, 6]]
  end

  it "creates new tree from array" do

    t = MagicalTree::Tree.new
    t.form_from_ary(example)

    t.must_be_instance_of MagicalTree::Tree
  end
end