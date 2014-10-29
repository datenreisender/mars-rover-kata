class Rover
  def initialize(x, y, heading)
    @position = [0,0]
  end

  def move(moves)
    @position[0] += 1 #forward
    @position[0] += 1 #forward
    # right
    @position[1] += 1 #forward
    @position[1] += 1 #forward
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
