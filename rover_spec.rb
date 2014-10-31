require './rover'

describe Rover do
  before(:example) do
    @rover = Rover.new([1,1], :north, Planet.new(100,100))
  end

  it 'moves around' do
    expect(@rover.move('ffrff').position).to eq [3,3]
  end

  it 'moves backward' do
    expect(@rover.move('b').position).to eq [0,1]
  end

  it 'turns left and right' do
    expect(@rover.move('rflf').position).to eq [2,2]
  end

  it 'moves in any direction' do
    expect(@rover.move('rfrfrfrf').position).to eq [1,1]
    expect(@rover.move('blblblbl').position).to eq [1,1]
  end

  it 'starts in any direction' do
    expect(Rover.new([1,1], :north, Planet.new(100,100)).move('f').position).to eq [2,1]
    expect(Rover.new([1,1], :east,  Planet.new(100,100)).move('f').position).to eq [1,2]
    expect(Rover.new([1,1], :south, Planet.new(100,100)).move('f').position).to eq [0,1]
    expect(Rover.new([1,1], :west,  Planet.new(100,100)).move('f').position).to eq [1,0]
  end

  it 'wraps around the edges of the grid' do
    expect(Rover.new([4,2], :north, Planet.new(5,3)).move('f').position).to eq [0,2]
    expect(Rover.new([0,0], :south, Planet.new(5,3)).move('f').position).to eq [4,0]
    expect(Rover.new([4,2], :east, Planet.new(5,3)).move('f').position).to eq [4,0]
    expect(Rover.new([0,0], :west, Planet.new(5,3)).move('f').position).to eq [0,2]
  end

  it 'stops in front of obstacles' do
    planet = Planet.new(5,5, [2,1])
    rover = Rover.new([1,1], :north, planet)

    expect(rover.move('f').position).to eq [1,1]
  end

  it 'knows when its movement was stopped by an obstacles' do
    planet = Planet.new(5,5, [2,1])
    rover = Rover.new([1,1], :north, planet)

    expect(rover.stopped_by_obstacle?).to be_falsy
    expect(rover.move('f').stopped_by_obstacle?).to be_truthy
  end

  it 'interrupts the movement when its movement was stopped by an obstacles' do
    planet = Planet.new(5,5, [2,1])
    rover = Rover.new([1,1], :north, planet)

    rover.move('frf')
    expect(rover.stopped_by_obstacle?).to be_truthy
    expect(rover.position).to eq [1,1]
  end
end
