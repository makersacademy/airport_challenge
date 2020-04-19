require 'air'
require 'plane'

describe Air do

  it 'responds to add(Plane)' do
    expect(subject).to respond_to(:add).with(1).argument
  end
  
  it '.add(Plane) returns true or false' do
    air = Air.new
    plane = Plane.new
    expect(air.add(plane)).to eq(true).or eq(false)
  end
end
