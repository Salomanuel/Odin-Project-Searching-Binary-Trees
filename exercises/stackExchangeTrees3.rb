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

	if !first_element.nil? and first_element > last_element
		return nil
	end

	root = Node.new(array[mid])
	root.left  = build_tree(array[0..mid-1], 0, mid-1)
	root.right = build_tree(array[mid+1..-1], mid+1, array.length -1)

	return root
end