class Rover
  def initialize(x, y, heading)
    @position = [x, y]
    @direction = 0
  end

  def roll(fields)
    @position[@direction % 2] += (@direction < 2 ? 1 : -1) * fields
  end

  def turn(angle)
    @direction = (@direction + angle + 4) % 4
  end

  def move(moves)
    moves.each_char do |c|
      case c
      when 'f' then roll(1)
      when 'b' then roll(-1)
      when 'r' then turn(1)
      when 'l' then turn(-1)
      end
    end
    self
  end

  def position
    @position
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
