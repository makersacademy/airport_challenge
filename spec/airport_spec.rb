require 'airport'
require 'plane'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it { should respond_to(:open?) }

  it { should respond_to(:land).with(1).argument }

  it { should respond_to(:take_off).with(1).argument }

  it 'should be open' do
    expect(airport.open?).to be true
  end

  it 'should store planes in an array' do
    expect(airport.planes.is_a?(Array)).to eq(true)
  end

  # should this include a double?
  it 'should add planes to array' do
    airport.land(:plane)
    expect(airport.planes).to include(:plane)
  end

  # include doubles?
  it 'should take planes out of the array' do
    airport.land(:plane)
    airport.take_off(:plane)
    expect(airport.planes).to be_empty
  end

  it 'should raise error when the airport is full' do
    airportfull = Airport.new(0)
    expect { airportfull.land(:plane) }.to raise_error('Airport is full!')
  end

end
