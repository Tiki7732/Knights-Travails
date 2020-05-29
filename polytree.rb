class PolyTreeNode

    attr_accessor :value, :children
    attr_reader :parent
    
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node)
        return if self.parent == node
        self.parent.children.delete(self) unless self.parent.nil?
        @parent = node
        self.parent.children.push(self) unless node.nil?
        self
    end

    def children
        @children
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if child_node && !self.children.include?(child_node)
            raise "Not a real child!"
        end
        child_node.parent = nil         
    end

    def dfs(target)
        return self if target == value
        children.each do |child| 
            result = child.dfs(target)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target)
        search_arr = []
        search_arr.push(self)
        while !search_arr.empty?
            current_node = search_arr.shift
            return current_node if current_node.value == target
            search_arr.concat(current_node.children)
        end
        nil
    end
end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []