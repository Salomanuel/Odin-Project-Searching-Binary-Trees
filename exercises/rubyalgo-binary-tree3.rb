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
end


	 10
3		  15
	   12 19