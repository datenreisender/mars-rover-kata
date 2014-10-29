class Rover
  def initialize(x, y, heading)
    @position = [0,0]
    @direction = 0
  end

  def move(moves)
    moves.each_char do |c|
      case c
      when 'f' then @position[@direction] += 1
      when 'r' then @direction = 1
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
end
