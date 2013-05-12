require 'minitest/autorun'
require_relative '../../magical_tree'

describe MagicalTree::PathFinder do

  let(:example) do
    [[3],
     [7, 4],
     [2, 4, 6],
     [8, 5, 9, 3]]
  end

  it "finds path with the highest cost" do

    t = MagicalTree::Tree.new
    t.form_from_ary(example)

    p = MagicalTree::PathFinder.new
    p.find_highest_cost(t)

    p.cost.must_equal 23
    p.path.must_equal [9, 4, 7, 3]
  end
end