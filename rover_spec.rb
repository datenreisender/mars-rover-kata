require './rover'

describe Rover do
  before(:example) do
    @rover = Rover.new(1,1,:north)
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
    expect(Rover.new(1,1,:north).move('f').position).to eq [2,1]
    expect(Rover.new(1,1,:east ).move('f').position).to eq [1,2]
    expect(Rover.new(1,1,:south).move('f').position).to eq [0,1]
    expect(Rover.new(1,1,:west ).move('f').position).to eq [1,0]
  end
end
