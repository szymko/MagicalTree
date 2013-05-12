module MagicalTree
  class Node
    class TooManyChildrenError < StandardError; end

    attr_reader :cumulative_value, :better_child, :children, :object
    attr_accessor :parent, :path

    def initialize(object = nil)
      @object = object
      @cumulative_value = object
      @children = []
      @path = []
    end

    def choose_better_child
      @better_child = @children.sort { |a,b| a.cumulative_value <=> b.cumulative_value }.last
      @cumulative_value += @better_child.cumulative_value
      @better_child
    end

    def add_child(child)
      if @children.length < 2
        @children << child
      else
        raise TooManyChildrenError
      end
    end

    def adopt(children)
      children.each { |c| add_child(c) }
    end

    def is_root?
      @parent.nil?
    end

  end
end