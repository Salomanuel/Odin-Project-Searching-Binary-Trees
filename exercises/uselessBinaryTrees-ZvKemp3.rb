module BinaryTree
	class Node
		attr_reader  	:value
		attr_accessor	:left, :right

		def initialize(v)
			@value = v
		end

		def insert(v)
			case	value <=> v
			when  1 then insert_left(v)
			when -1 then insert_right(v)
			when  0 then false # => value is already there
			end
		end

		def inspect
			# return "" if left.inspect == nil and right.inspect == nil
			"{#{value}::#{left.inspect}|#{right.inspect}}"
		end

		private
		def insert_left(v)
			left 	? left.insert(v) 	: self.left = Node.new(v)
		end

		def insert_right(v)
			right ? right.insert(v) : self.right = Node.new(v)
		end
	end
end

tree       = BinaryTree::Node.new(10)
tree.left  = BinaryTree::Node.new(5)
tree.right = BinaryTree::Node.new(15)

# puts tree.inspect
tree.insert(1)
[7, 8, 13, 2, 4, 17, 6, 11, 2, 0].each { |n| tree.insert(n) }
puts tree.inspect