module MagicalTree
  class Tree

    attr_accessor :root, :rows

    def initialize
      @root = []
      @rows = []
    end

    # def add_root(root)
    #   raise ArgumentError unless node?(root)
    #   @root = root
    #   @rows[0].append(root)
    # end

    # def add_node(parent, child)
    #   raise ArgumentError unless nodes?(parent, child)

    #   parent.children << child
    #   child.parent = parent
    # end

    # [ [3],
    #   [7, 4],
    #   [2, 4, 6] ]
    def form_from_ary(ary)
      @rows = Array.new(ary.length) { Row.new }
      ary.each_with_index do |r, i|
        @rows[i].append(r)
        @rows[i-1].attach_children(@rows[i]) unless i == 0
      end

      @root = @rows[0].nodes.first
    end

    # def node?(*args)
    #   args.reduce(true) { |rest, a| a.is_a? Node }
    # end

    # alias :nodes? :node?
  end
end