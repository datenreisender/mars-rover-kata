class Direction
  def self.of(heading)
    self.new(%i(north east south west).index(heading))
  end

  def initialize(value = 0)
    @value = value
    freeze
  end

  def turn(angle)
    Direction.new((@value + angle) % 4)
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

  def initialize(x, y, heading, planet_x, planet_y)
    @position = [x, y]
    @planet_size = [planet_x, planet_y]
    @direction = Direction.of(heading)
  end

  def roll(fields)
    @position[@direction.roll_dimension] += (@direction.roll_sign * fields)
    @position[@direction.roll_dimension] %= @planet_size[@direction.roll_dimension]
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
