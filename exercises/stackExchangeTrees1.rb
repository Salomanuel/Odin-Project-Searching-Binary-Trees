class BinarySearchTree
	attr_accessor :data, :left, :right

	def initialize(data)
		@data = data
	end

	def insert(data)
		if @data < data
			@right.nil? ? @right = BinarySearchTree.new(data) : @right.insert(data)
		elsif @data >= data
			@left.nil?	? @left  = BinarySearchTree.new(data) :  @left.insert(data)
		end
	end
end

ginkgo = BinarySearchTree.new(10)

ginkgo.insert(2)