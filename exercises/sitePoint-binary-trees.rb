class TreeNode
	attr_accessor :left, :right, :value
	def initialize(value, left, right)
		@value = value
		@left, @right = left, right
	end

	def print_inorder
		@left.print_inorder  unless @left.nil?
		puts @value
		@right.print_inorder unless @right.nil?
	end

	def inorder(&block)
		@left.inorder(&block)  unless @left.nil?
		yield @value
		@right.inorder(&block) unless @right.nil?
	end
end

left_child  = TreeNode.new(1, nil, nil)
right_child = TreeNode.new(3, nil, nil)
root        = TreeNode.new(2,left_child,right_child)

# puts root.print_inorder
puts root.inorder{ |value| puts value }


# puts left_child.print_inorder
