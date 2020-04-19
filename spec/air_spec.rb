require 'air'
require 'plane'

describe Air do

  it 'responds to add(Plane)' do
    expect(subject).to respond_to(:add).with(1).argument
  end
  
  it 'responds to planes' do
    expect(subject).to respond_to(:planes)
  end
  
  it '.add(Plane) returns true or false' do
    air = Air.new
    plane = Plane.new
    expect(air.add(plane)).to eq(true).or eq(false)
  end
  
  it 'check for @planes instance variable' do
    # TODO: This doesn't seem to actually check for the instance variable
    air = Air.new
    expect(air.instance_variable_get(:@planes))
  end

end
