
module BinaryTree
	class Node
		attr_reader 	:value
		attr_accessor :left, :right

		def initialize(v)
			@value = v
		end

		def insert(v)
			case (value <=> v)
			when  1 then insert_left(v)
			when -1 then insert_right(v)
			when  0 then false #the value is already there
			end
		end

		def include?(v)
			case value <=> v
			when 1 then left.include?(v)
			when -1 then right.include?(v)
			when 0 then true #the current node has it
			end
		end

		def inspect
			"{#{value}::#{left.inspect}|#{right.inspect}}"
		end

		private
		# def insert_left(v)
		# 	left.insert(v) or self.left = Node.new(v)
		# end
    def insert_left(v)
      left.insert(v) or self.left = Node.new(v)
    end


		def insert_right(v)
			right.insert(v) or self.right = Node.new(v)
		end
	end

	class EmptyNode
		def initialize(v)
			@value = v
			@left  = EmptyNode.new
			@right = EmptyNode.new
		end

		def include?(*)
			false
		end

		def insert(*)
			false
		end

		def inspect
			"{}"
		end
	end
end

tree = BinaryTree::Node.new(10)
tree.left = BinaryTree::Node.new(5)
# tree.right = BinaryTree::Node.new(15)
puts tree.inspect
# tree.insert(3)
# puts tree.inspect
# puts tree.include?(3)
# puts tree.include?(4)	# => TO BE FIXED
# happy = BinaryTree::Node.new(10).left


#ORIGINAL CODE BY AUTHOR (doesn't work anyway)
=begin
module BinaryTree
  class EmptyNode
    def to_a
      []
    end

    def include?(*)
      false
    end

    def push(*)
      false
    end
    alias_method :<<, :push

    def inspect
      "{}"
    end
  end

  class Node
    # our three features:
    attr_reader :value
    attr_accessor :left, :right

    def initialize(v)
      @value = v
      @left = EmptyNode.new
      @right = EmptyNode.new
    end

    def push(v)
      case value <=> v
      when 1 then push_left(v)
      when -1 then push_right(v)
      when 0 then false # the value is already present
      end
    end
    alias_method :<<, :push

    def include?(v)
      case value <=> v
      when 1 then left.include?(v)
      when -1 then right.include?(v)
      when 0 then true # the current node is equal to the value
      end
    end

    def inspect
      "{#{value}:#{left.inspect}|#{right.inspect}}"
    end

    def to_a
      left.to_a + [value] + right.to_a
    end

    private

      def push_left(v)
        left.push(v) or self.left = Node.new(v)
      end

      def push_right(v)
        right.push(v) or self.right = Node.new(v)
      end
  end
end
=end
# tree       = BinaryTree::Node.new(10)
# tree.left  = BinaryTree::Node.new(5)
# tree.right = BinaryTree::Node.new(15)
# tree.insert(3)
# puts tree.inspect
# puts tree.include?(3)
# puts tree.include?(4) # => NON VA
# happy = BinaryTree::EmptyNode.new(10) #=> 