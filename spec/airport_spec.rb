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
  
  it 'should identify which plane is no longer present' do
    expect(airport.takeoff(plane)).to eq("#{plane} no longer in airport")
  end
end
