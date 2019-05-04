require 'airport'

describe Airport do

  it 'will respond to land' do
      expect(Airport.new).to respond_to(:land)
  end

  it 'will instruct a plane to land if sunny' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(false)
    expect(airport.land(plane)).to eq('Cleared to land')
  end

  it 'will not allow a plane to land if it is stormy' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error(RuntimeError, 'Plane cannot land due to bad weather')
  end

  it 'will respond to take off' do
    expect(Airport.new).to respond_to(:take_off)
  end

  it 'will instruct a plane to take off if sunny' do
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return(false)
    expect(airport.take_off).to eq('Cleared for take off')
  end

  it 'will ground planes if it is stormy' do
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.take_off }.to raise_error(RuntimeError, 'Planes are grounded due to bad weather')
  end
end

  # it 'create airport with a capacity' do
  #   airport = Airport.new
  #   expect(airport.capacity).to eq(100)
  # end
