class Tree
	class Node
		attr_reader :value, :left, :right
		attr_accessor :parent
		def initialize(value)
			@value  = value
			@right  = nil
			@left   = nil
			@parent = nil
		end

		def insert(new_value)
			if new_value <= @value
				if @left.nil?
					@left = Node.new(new_value)
					@left.parent = self
				else
					@left.insert(new_value)
				end
			elsif new_value > @value
				if @right.nil?
					@right = Node.new(new_value)
					@right.parent = self
				else
					@right.insert(new_value)
				end
			end
		end
	end

	attr_accessor :root

	def initialize
		@root = nil
	end

	def insert(value)
		if @root == nil
			@root = Node.new(value)
		else
			@root.insert(value)
		end
	end

	def build_tree(ary)
		ary.each { |n| self.insert(n) }
	end
end


ary = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new

tree.insert(3)
tree.build_tree(ary)
puts tree.inspect