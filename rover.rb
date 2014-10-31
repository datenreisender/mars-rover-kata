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

class Position
  attr_reader :current

  def initialize(current, planet)
    @current = current
    @planet = planet
    freeze
  end

  def roll(fields, direction)
    new_pos = @current.dup
    new_pos[direction.roll_dimension] += (direction.roll_sign * fields)
    new_pos[direction.roll_dimension] %= @planet.size[direction.roll_dimension]

    if @planet.obstacle_on?(new_pos)
      [true, self]
    else
      [false, Position.new(new_pos, @planet)]
    end
  end
end

class Planet
  attr_reader :size

  def initialize(size_x, size_y, *obstacles)
    @size = [size_x, size_y]
    @obstacles = obstacles
    freeze
  end

  def obstacle_on?(pos)
    @obstacles.include?(pos)
  end
end

class Rover
  def initialize(pos, heading, planet)
    @position = Position.new(pos, planet)
    @direction = Direction.of(heading)
    @stopped_by_obstacle = false
  end

  def move(moves)
    moves.each_char do |c|
      case c
      when 'f' then @stopped_by_obstacle, @position = @position.roll(1, @direction)
      when 'b' then @stopped_by_obstacle, @position = @position.roll(-1, @direction)
      when 'r' then @direction = @direction.turn(1)
      when 'l' then @direction = @direction.turn(-1)
      end

      break if @stopped_by_obstacle
    end
    self
  end

  def position
    @position.current
  end

  def stopped_by_obstacle?
    @stopped_by_obstacle
  end
end
