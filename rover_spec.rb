class Rover
  def initialize(x, y, heading)
    @position = [0,0]
    @direction = 0
  end

  def move(moves)
    'ffrff'.each_char do |c|
      @position[@direction] += 1  if c == 'f'
      @direction = 1              if c == 'r'
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
