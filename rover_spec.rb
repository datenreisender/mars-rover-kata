require './rover'

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
