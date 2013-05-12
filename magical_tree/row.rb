module MagicalTree
  class Row

    attr_accessor :nodes

    def initialize
      @nodes = []
    end

    def append(objects)
      objects.each { |o| @nodes << Node.new(o) }
    end

    def attach_children(child_row)
      current_node = 0
      child_row.nodes.each_cons(2) do |ch|
        @nodes[current_node].adopt(ch)
        current_node += 1
      end
    end

  end
end