class Direction
  attr_reader :value

  def initialize
    @value = 0
  end

  def turn(angle)
    @value = (@value + angle + 4) % 4
  end
end

class Rover
  attr_reader :position

  def initialize(x, y, heading)
    @position = [x, y]
    @direction = Direction.new
  end

  def roll(fields)
    @position[@direction.value % 2] += (@direction.value < 2 ? 1 : -1) * fields
  end

  def move(moves)
    moves.each_char do |c|
      case c
      when 'f' then roll(1)
      when 'b' then roll(-1)
      when 'r' then @direction.turn(1)
      when 'l' then @direction.turn(-1)
      end
    end
    self
  end
end

describe Rover do
  before(:example) do
    @rover = Rover.new(1,1,:north)
  end

  it 'can move around' do
    expect(@rover.move('ffrff').position).to eq [3,3]
  end

  it 'can move backward' do
    expect(@rover.move('b').position).to eq [0,1]
  end

  it 'can move left and right' do
    expect(@rover.move('rflf').position).to eq [2,2]
  end

  it 'can move in every direction' do
    expect(@rover.move('rfrfrfrf').position).to eq [1,1]
    expect(@rover.move('blblblbl').position).to eq [1,1]
  end
end
