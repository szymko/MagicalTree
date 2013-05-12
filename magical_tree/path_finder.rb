module MagicalTree
  class PathFinder

    attr_reader :cost, :path

    def initialize
      @cost = nil
      @path = []
    end

    def find_optimal_path(tree)
      tree.rows[0..-2].reverse.each do |r|
        r.nodes.each do |n|
          better_child = n.choose_better_child
          n.path = better_child.path + [better_child.object]
        end
      end

      @cost = tree.root.cumulative_value
      @path = tree.root.path << tree.root.object 
    end
  end
end