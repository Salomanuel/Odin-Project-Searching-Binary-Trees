class BinaryTree
	class Node
		attr_reader :value, :left, :right
		def initialize(value)
			@value = value
			@left  = nil
			@right = nil
		end

		def insert(new_value)
			if new_value < @value
				if @left.nil?
					@left = Node.new(new_value)
				else
					left.insert(new_value)
				end
			elsif new_value > @value
				if @right.nil?
					@right = Node.new(new_value)
				else
					right.insert(new_value)
				end
			end
		end
	end

	def initialize
		@root = nil
	end

	def insert(value)
		if @root.nil?
			@root = Node.new(value)
		else
			@root.insert(value)
		end
	end

	def in_order(node=@root, &block)
		return if node.nil?
		in_order(node.left, &block)
		yield node
		in_order(node.right, &block)
	end

	def search(key, node=@root)
		return false if node.nil?
		if key < node.value
			search(key, node.left)
		elsif key > node.value
			search(key, node.right)
		else#if key == node.value
			return node
		end
	end

end

tree = BinaryTree.new

# tree.insert(10)
ary = [4, 18, 2, 5, 7, 16, 19, 10, 0, 6]
ary.each { |n| tree.insert(n) }
tree.in_order{ |n| puts n.value }

puts tree.search(18)
puts tree.search(17)