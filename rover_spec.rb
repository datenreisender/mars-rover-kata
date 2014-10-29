class Rover
  def initialize(x, y, heading)
    @position = [x, y]
    @direction = 0
  end

  def move(moves)
    moves.each_char do |c|
      case c
      when 'f' then @position[@direction % 2] += @direction < 2 ? 1 : -1
      when 'b' then @position[@direction % 2] -= @direction < 2 ? 1 : -1
      when 'r' then @direction = (@direction + 1) % 4
      when 'l' then @direction = (@direction + 3) % 4
      end
    end
    self
  end

  def position
    @position
  end
end

describe Rover do
  it 'can move around' do
    rover = Rover.new(0,0,:north).move('ffrff')
    expect(rover.position).to eq [2,2]
  end

  it 'can move backward' do
    rover = Rover.new(1,1,:north).move('b')
    expect(rover.position).to eq [0,1]
  end

  it 'can move left and right' do
    rover = Rover.new(1,1,:north).move('rflf')
    expect(rover.position).to eq [2,2]
  end

  it 'can move in every direction' do
    rover = Rover.new(1,1,:north).move('rfrfrfrf')
    expect(rover.position).to eq [1,1]
    rover = Rover.new(1,1,:north).move('blblblb')
    expect(rover.position).to eq [1,1]
  end
end
