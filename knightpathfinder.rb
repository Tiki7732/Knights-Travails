require_relative 'polytree'
class KnightPathFinder

    def self.valid_moves(pos)
        x, y = pos
        possible_moves = [[x+2, y+1], [x+2, y-1], [x+1, y+2], [x+1, y-2], 
            [x-2, y+1], [x-2, y-1], [x-1, y+2], [x-1, y-2]]
        possible_moves.reject!{|move| move if !within_grid(move)}
        possible_moves
    end

    def self.within_grid(pos)
        x, y = pos
        return false if x < 0 || x > 7
        return false if y < 0 || y > 7
        true
    end

    def initialize(pos)
        root_node = PolyTreeNode.new(pos)
        build_move_tree
        @considered_positions = [pos]
    end

    def build_move_tree

    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_moves.reject!{|move| move if @considered_positions.include?(move)}
        @considered_positions.concat(possible_moves)
        possible_moves

    end

    def find_path

    end
end

knight = KnightPathFinder.new([0,1])
p knight.new_move_positions([0,1])
p knight.new_move_positions([2,0])