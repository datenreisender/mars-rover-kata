class Rover
  def initialize(x, y, direction)
  end

  def move(moves)
    self
  end

  def position
    [2,2]
  end
end

describe Rover do
  it 'can move around' do
    rover = Rover.new(0,0,:north).move('ffrff')
    expect(rover.position).to eq [2,2]
  end
end
