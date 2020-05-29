require_relative 'polytree'
class KnightPathFinder

    def self.valid_moves(pos)
        x, y = pos
        possible_moves = []
        
    end

    def initialize(pos)
        @grid = Array.new(8){Array.new(8)}
        root_node = PolyTreeNode.new(pos)
        build_move_tree
        @considered_positions = [pos]
    end

    def build_move_tree

    end

    def new_move_positions(pos)

    end

    def find_path

    end
end

knight = KnightPathFinder.new([0,1])