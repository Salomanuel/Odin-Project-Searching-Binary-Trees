class Node
	attr_accessor :left, :right, :value
	def initialize(value, left = nil, right = nil)
		@value      = value
		self.left  ||= nil
		self.right ||= nil
	end

	def add(node)
		raise "should be a node" if node.class != Node
		(node.value <= @value) ? (self.left = node) : (self.right = node)
	end

	def inspect
	return self.value if left == nil and right == nil
	return "{#{self.value}::(#{left.inspect}|#{right.inspect})}"
	end
end

dieci  = Node.new(10)
cinque = Node.new(5)
otto   = Node.new(8)
due    = Node.new(2)

dieci.add(cinque)
# dieci.left = cinque
puts dieci.inspect