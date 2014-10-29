class Rover
  def initialize(x, y, heading)
    @position = [0,0]
  end

  def move(moves)
    'ff'.each_char do |c|
      @position[0] += 1 if c == 'f'
    end
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
