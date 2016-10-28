class Node
	attr_accessor :value, :left, :right

	def initialize(value)
		@value = value
	end
end

def build_tree(array, *indices)
		array.sort.uniq!
		mid           = (array.length-1)/2
		first_element = indices[0]
		last_element  = indices[1]

		return nil if !first_element.nil? and first_element > last_element

		root = Node.new(array[mid])
		root.left	 = build_tree(array[0..mid-1],0,mid-1)
		root.right = build_tree(array[mid+1..-1], mid+1, array.length-1)

		return root
end

def breadth_first_search(HJKDFGAHJKDFGHJK)
binary_tree = build_tree([4,7,2,8,1,1,1,30,22,4,9])
