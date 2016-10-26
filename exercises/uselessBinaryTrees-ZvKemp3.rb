module BinaryTree
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
			"{#{value}::#{left.inspect}|#{right.inspect}}"
		end

		def include?(v)
			case value <=> v
			when  1 then (!left.nil?)  ? (left.include?(v))  : (return false)
			when -1 then (!right.nil?) ? (right.include?(v)) : (return false)
			when  0 then true # => current node is equal to value
			end
		end


		private
		def insert_left(v)
			left 	? left.insert(v) 	: self.left = Node.new(v)
			# left.insert(v) 	or self.left 	= Node.new(v)
		end

		def insert_right(v)
			# right.insert(v) or self.right = Node.new(v)
			right ? right.insert(v) : self.right = Node.new(v)
		end
	end
end
# manuel tree
	# tree       = BinaryTree::Node.new(10)
	# tree.left  = BinaryTree::Node.new(5)
	# tree.right = BinaryTree::Node.new(15)
	# tree.insert(1)
	# [7, 8, 13, 2, 4, 17, 6, 11, 2, 0].each { |n| tree.insert(n) }
	# puts tree.inspect
	# puts tree.include?(11)
# zvkemp tree
	tree = BinaryTree::Node.new(10)
	[5,15,3].each { |value| tree.insert(value) }
	[10,15,20,3,2].each { |v| puts tree.include?(v) }
	# puts tree.include?(11)