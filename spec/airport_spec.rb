require './lib/airport.rb'

describe Airport do
  it 'expects airport to be an instance of airport class' do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end

  it 'responds to the method land' do
    airport = Airport.new
    allow(airport).to receive(:stormy) { false }
    expect(airport).to respond_to(:land)
  end

  it 'responds to the method takeoff' do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    expect(airport).to respond_to(:takeoff)
  end

  it 'expects a plane to land at the airport and then be in the airport' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    expect(airport.planes.include?(plane)).to eq(true)
  end

  it 'expects a plane to takeoff and no longer be at the airport' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.planes.include?(plane)).to eq(false)
  end

  it 'responds to the method full' do
    airport = Airport.new
    expect(airport).to respond_to(:full?)
  end

  it 'raises an error if the airport is full and you try to land' do
    airport = Airport.new(20)
    allow(airport).to receive(:stormy?) { false }
    expect { 21.times { airport.land(Plane.new) } }.to raise_error 'Airport is full'
  end

  it 'has a default capacity in this case set to 20' do
    airport = Airport.new
    expect(airport.capacity).to eq(20)
  end

  it 'has a capacity that can be overridden as appropriate' do
    airport = Airport.new(30)
    expect(airport.capacity).to eq(30)
  end

  it 'has a method that tells us whether it is stormy or not' do
    airport = Airport.new
    expect(airport).to respond_to(:stormy?)
  end

  it 'should tell us whether it is stormy or not' do
    airport = Airport.new
    expect(airport.stormy?).to eq(true) | eq(false)
  end

  it 'should not let a plane take off if stormy' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { true }
    expect { airport.takeoff(plane) }.to raise_error 'Cannot take-off while stormy'
  end

  it 'should not let a plane land if stormy' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { true }
    expect { airport.land(plane) }.to raise_error 'Cannot land while stormy'
  end

  it 'should not allow takeoff from an airport it is not in' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    expect { airport.takeoff(plane) }.to raise_error 'Plane not at this airport'
  end

  it 'should not allow planes to land if they are already landed' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error 'Plane already landed'
  end
end
