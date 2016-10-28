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
end

tree = BinarySearchTree.new
# 6.times { |n| tree.insert(n) }

randi = [4, 18, 2, 5, 7, 16, 19, 10, 0, 6]
randi.each { |n| tree.insert(n) }

puts tree.in_order { |n| print n.key.to_s + " " }

puts "*"*30

puts tree.pre_order { |n| print n.key.to_s + " " }

puts "*"*30

puts tree.post_order { |n| print n.key.to_s + " " }

