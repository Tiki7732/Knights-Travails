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
        return false if !x.between?(0, 7)
        return false if !y.between?(0, 7)
        true
    end

    attr_reader :considered_positions
    attr_accessor :root_node

    def initialize(pos)
        self.root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        build_move_tree
        
    end

    def build_move_tree
        nodes = [@root_node]
        until nodes.empty?
            current_node = nodes.shift
            make_next_row(current_node)
            nodes.concat(current_node.children)
        end

    end

    def make_next_row(parent_node)
        children = new_move_positions(parent_node.value)
        children.each do |child| 
            child_node = PolyTreeNode.new(child)
            child_node.parent = parent_node
            parent_node.add_child(child_node)
        end

    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_moves.reject!{|move| move if @considered_positions.include?(move)}
        @considered_positions.concat(possible_moves)
        possible_moves

    end

    def find_path(target_pos)
        target_node = self.root_node.bfs(target_pos)
        return target_node.value
    end
end

knight = KnightPathFinder.new([0,1])
p knight.find_path([6,5])
# p knight.considered_positions
# p "+++"
# p knight.new_move_positions([0,1])