def knight_moves(a, b)
  result = ''
  moves = [Move.new(a, [])]
  moves_visited = []
  while moves.length > 0
    target = moves.shift
    next if moves_visited.include?(target.position)
    moves_visited.push(target.position)

    if target.position == b
      path = target.path_tarvel.dup
      puts "made in #{path.dup.drop(1).length} : #{path}"
      break
    end
    target.next_moves.each do |move|
      moves.push(Move.new(move, target.path_tarvel))
    end
  end
end

class Move
  attr_accessor :position, :path_tarvel
  @@patterns = [[2,1], [2, -1], [-2,1], [-2,-1], [1,2], [1, -2], [-1,2], [-1, -2]]
  def initialize(position, path_tarvel)
    @position = position
    @path_tarvel = path_tarvel.dup << position
  end

  def next_moves
    moves = []
    @@patterns.each do |pattern|
      x1, y1 = pattern
      x2, y2 = @position
      x = x1 + x2
      y = y1 + y2
      next if x > 7 || y > 7
      moves.push([x, y])
    end
    return moves
  end
end
