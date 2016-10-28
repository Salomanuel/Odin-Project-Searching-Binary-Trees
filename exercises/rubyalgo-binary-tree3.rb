class BinarySearchTree
	class Node
		attr_reader :key, :left, :right

		def initialize(key)
			@key = key
			@left = nil
			@right = nil
		end

		def insert(v)
			if v <= @key
				if @left.nil?
					@left = Node.new(v)
				else
					@left.insert(v)
				end
			elsif v > @key
				if @right.nil?
					@right = Node.new(v)
				else
					@right.insert(v)
				end
			end
		end
	end
	def initialize
		@root = nil
	end

	def insert(key)
		if @root.nil?
			@root = Node.new(key)
		else
			@root.insert(key)
		end
	end

	def in_order(node=@root, &block)
		return if node.nil?
		in_order(node.left,  &block)
		yield node
		in_order(node.right, &block)
	end

	def pre_order(node=@root, &block)
		return if node.nil?
		yield node
		pre_order(node.left,  &block)
		pre_order(node.right, &block)
	end

	def post_order(node=@root, &block)
		return if node.nil?
		post_order(node.left,  &block)
		post_order(node.right, &block)
		yield node
	end

	def search(key, node=@root)
		return false if node.nil?
		if key < node.key
			search(key, node.left)
		elsif key > node.key
			search(key, node.right)
		else
			return node
		end
	end

	def check_height(node)
		return 0 if node.nil?
		
		leftHeight = check_height(node.left)
		return -1 if leftHeight == -1

		rightHeight = check_height(node.right)
		return -1 if rightHeight == -1

		diff = leftHeight - rightHeight
		if diff.abs > 1
			-1
		else
			[leftHeight, rightHeight].max + 1
		end
	end

	def is_balanced?(node=@root)
		check_height(node) == -1 ? false : true
	end
end

tree = BinarySearchTree.new
# 6.times { |n| tree.insert(n) }
# nodoOtto = tree.insert(8)

randi = [4, 18, 2, 5, 7, 16, 19, 10, 0, 6]
randi.each { |n| tree.insert(n) }

# puts tree.in_order { |n| print n.key.to_s + " " }
# puts "*"*30
# puts tree.pre_order { |n| print n.key.to_s + " " }
# puts "*"*30
# puts tree.post_order { |n| print n.key.to_s + " " }

# puts tree.search(10).class
# puts tree.search(11)

puts "is the tree balanced? #{tree.is_balanced?}"

# puts tree.is_balanced(nodoOtto)