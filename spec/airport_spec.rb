require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  it { is_expected.to respond_to(:land).with(1).argument }
  it 'adds plane to bunker when landed' do
    airport.land(Plane.new)
    expect(airport.bunker.length).to eq(1)
  end
  it 'removes plane from bunker when taking off' do
    2.times { airport.land(Plane.new) }
    airport.takeoff(Plane.new)
    expect(airport.bunker.length).to eq(1)
  end
  it 'Airplane instance takes capacity as an argument' do
    airport1 = Airport.new(25)
    expect(airport1.capacity).to eq(25)
  end
  it 'if no argument is given, default capacity is 125' do
    expect(airport.capacity).to eq(125)
  end
  it 'raises error if plane tries to land when airport is full' do
    expect { 130.times { airport.land(Plane.new) } }.to raise_error("Do not land, airport is full")
  end
  it 'raises error if plane tries to takeoff when airport is empty' do
    expect { airport.takeoff(Plane.new) }.to raise_error("No planes available for take off")
  end
  it 'raises error if a landed plane is asked to land' do
    gatwick = Airport.new
    plane = Plane.new
    gatwick.land(plane)
    expect { gatwick.land(plane) }.to raise_error
  end
end
