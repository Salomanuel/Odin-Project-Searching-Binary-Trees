module BinaryTree
  class Node
    attr_accessor :value, :left, :right

    def initialize(v)
      @value = v
    end

    def insert(v)
      case value <=> v
      when  1 then insert_left(v)
      when -1 then insert_right(v)
      # when  0 then false #value is already there
      end
    end

    def inspect
      return value if left == nil and right == nil
      "N #{value} :: {l#{left.inspect} | #|r#{right.inspect}}"
    end

    private
    def insert_left(v)
      left  ? (left.insert(v))  : (self.left  = Node.new(v))
    end

    def insert_right(v)
      right ? (right.insert(v)) : (self.right = Node.new(v))
    end
  end
end

tree       = BinaryTree::Node.new(10)
# tree.left  = BinaryTree::Node.new(5)
# tree.right = BinaryTree::Node.new(15)
# tree.insert(3)
# 10.times { |i| tree.insert(i) }
rando = 10.times.map{rand(20) }
rando.each { |r| tree.insert(r)}
puts tree.inspect
