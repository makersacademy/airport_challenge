require 'airport'
require 'plane'

describe AirPort do
  let(:airport) {AirPort.new}
  let(:plane) {Plane.new}

  it 'shoud respond to land method' do
    expect(airport.land(plane)).to include(plane)
  end
  
  it 'should respond to takeoff method' do
    expect(airport).to respond_to(:takeoff).with(1).argument
  end
    
end
