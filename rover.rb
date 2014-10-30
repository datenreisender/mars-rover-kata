class Direction
  def initialize(value = 0)
    @value = value
    freeze
  end

  def turn(angle)
    Direction.new((@value + angle + 4) % 4)
  end

  def roll_dimension
    @value % 2
  end

  def roll_sign
    @value < 2 ? 1 : -1
  end
end

class Rover
  attr_reader :position

  def initialize(x, y, heading)
    @position = [x, y]
    @direction = Direction.new
  end

  def roll(fields)
    @position[@direction.roll_dimension] += @direction.roll_sign * fields
  end

  def move(moves)
    moves.each_char do |c|
      case c
      when 'f' then roll(1)
      when 'b' then roll(-1)
      when 'r' then @direction = @direction.turn(1)
      when 'l' then @direction = @direction.turn(-1)
      end
    end
    self
  end
end
