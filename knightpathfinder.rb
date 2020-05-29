require_relative 'polytree'
class KnightPathFinder

    def initialize(pos)
        @grid = Array.new(8){Array.new(8)}
        self.root_node = PolytreeNode.new(pos)
    end
end
