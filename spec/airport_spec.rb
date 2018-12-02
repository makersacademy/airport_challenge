require 'airport'

RSpec.describe Airport do 
  it 'should respond to plane' do
    expect(subject).to respond_to :land
  end
  it 'should instruct plane to land' do 
    plane = subject.land(plane)
    expect(plane).to eq plane
  end
 it 'should put a plane in the hanger when lands' do
  plane = Plane.new
  expect(subject.land(plane)).to eq [plane]
  end

  it 'should respond to take off' do
    expect(subject).to respond_to :take_off
  end
  it 'should be able to set to the default capacity if no capacity given' do
    airport = Airport.new
    expect(airport.capacity).to eq 50
  end
  it 'should be able to set airports capacity to a desired capacity' do
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
end
  
end