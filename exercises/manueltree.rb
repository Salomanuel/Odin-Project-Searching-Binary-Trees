class Tree
	class Node
		attr_accessor :left, :right, :value
		def initialize(value)
			@value = value
			@left  = nil
			@right = nil
		end

		def insert(key)
			if key 	<= 	@value
				if @left.nil?
					@left = Node.new(key)
				else
					@left.insert(key)
				end
			elsif key > @value
				if @right.nil?
					@right = Node.new(key)
				else
					@right.insert(key)
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
		in_order(node.left, &block)
		yield node
		in_order(node.right, &block)
	end

	def pre_order(node=@root, &block)
		return if node.nil?
		yield node
		in_order(node.left, &block)
		in_order(node.right, &block)
	end

	def post_order(node=@root, &block)
		return if node.nil?
		in_order(node.left, &block)
		in_order(node.right, &block)
		yield node
	end

	def search(key, node=@root)
		return nil if node.nil?
		if 		key < node.value
			search(key, node.left)
		elsif key > node.value
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

# commands from my first tree
	# ginkgo = Tree.new
	# ginkgo.insert(10)
	# ginkgo.insert(5)
	# 10.times { |i| ginkgo.insert(i) }
	# # ginkgo.in_order { |node| puts node.value }
	# # ginkgo.pre_order { |node| puts node.value }
	# # ginkgo.post_order { |node| puts node.value }
	# puts ginkgo.check_height(ginkgo.search(1))
	# puts ginkgo.is_balanced?
# commands from http://rubyalgorithms.com
	# tree = Tree.new
	# tree.insert(50)
	# tree.insert(25)
	# tree.insert(75)
	# tree.insert(12)
	# tree.insert(37)
	# tree.insert(87)
	# tree.insert(63)
	# puts tree.inspect
	# puts "tree.is_balanced?"
	# puts tree.is_balanced?
# commands from OdinProject
	odin = Tree.new
	nodes = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
	nodes.each { |n| odin.insert(n) }
	# odin.post_order { |n| puts n.value }
	# puts odin.is_balanced?
	puts odin.search(23)