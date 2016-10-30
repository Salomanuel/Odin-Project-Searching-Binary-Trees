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

	def breadth_first_search(node=@root, level=0, list=[])
		list[level] ||= []
		list[level] << node
		if !node.left.nil?
			breadth_first_search(node.left,  level+=1, list)
		end
		if !node.right.nil?
			breadth_first_search(node.right, level+=1, list)
		end
		return list
	end
end


ary = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
letters = %w(F D J B E G K A C I H)
tree = Tree.new
# tree.insert(3)
# tree.build_tree(ary)
tree.build_tree(letters)
breadth = tree.breadth_first_search
# puts breadth#[0].class
breadth.each do |ary| 
	print "#{breadth.index(ary)} "
	ary.each { |n| print "#{n.value }" }
	puts "\n"
end
# puts tree.inspect