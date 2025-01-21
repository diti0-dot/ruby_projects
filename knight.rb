KNIGHT_MOVES = [
  [2, 1], [1, 2], [-1, 2], [-2, 1],
  [-2, -1], [-1, -2], [1, -2], [2, -1]
]

def knight_moves(start, target)
  return [start] if start == target

  queue = [[start, [start]]]
  visited = []

  until queue.empty?
    current_position, path = queue.shift
    x, y = current_position

    KNIGHT_MOVES.each do |dx, dy|
      next_position = [x + dx, y + dy]

      if valid_position?(next_position) && !visited.include?(next_position)
        visited << next_position
        new_path = path + [next_position]
        return new_path if next_position == target
        queue << [next_position, new_path]
      end
    end
  end
end

def valid_position?(position)
  position.all? { |coord| coord.between?(0, 7) }
end

def test_knight_moves(start, target)
  path = knight_moves(start, target)
  puts "You made it in #{path.length - 1} moves! Here's your path:"
  path.each { |step| p step }
end

test_knight_moves([0, 0], [7, 7])
