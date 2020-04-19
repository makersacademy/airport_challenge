require 'airport'
require 'weather'
require 'plane'

describe Airport do

  it 'responds to full?' do
    expect(subject).to respond_to(:full?)
  end
  
  it 'responds to capacity' do
    expect(subject).to respond_to(:capacity)
  end

  it 'responds to weather' do
    expect(subject).to respond_to(:weather)
  end
  
  it 'responds to planes' do
    expect(subject).to respond_to(:planes)
  end

  it 'responds to add(Plane)' do
    expect(subject).to respond_to(:add).with(1).argument
  end

  it 'responds to del(Plane)' do
    expect(subject).to respond_to(:del).with(1).argument
  end
  
  it 'check for @capacity instance variable' do
    airport = Airport.new
    expect(airport.instance_variable_get(:@capacity))
  end
  
  it 'check for @planes instance variable' do
    # TODO: This doesn't seem to actually check for the instance variable
    airport = Airport.new
    expect(airport.instance_variable_get(:@planes))
  end

  it 'check @capacity instance variable is positive integer' do
    airport = Airport.new
    airport.capacity = -1
    expect(airport.instance_variable_get(:@capacity)).to be >= 0
  end
  
  it '.full? returns true or false' do
    airport = Airport.new
    expect(airport.full?).to eq(true).or eq(false)
  end

  it '.full? returns true when forced' do
    airport = Airport.new
    allow(airport).to receive(:full?) { true }
    expect(airport.full?).to eq(true)
  end

  it '.full? returns false when forced' do
    airport = Airport.new
    allow(airport).to receive(:full?) { false }
    expect(airport.full?).to eq(false)
  end

  it '.capacity returns positive integer' do
    airport = Airport.new
    expect(airport.capacity).to be >= 0 
    expect(airport.capacity).to be_an(Integer) 
  end

  it 'check .capacity=num sets capacity' do
    airport = Airport.new
    new_capacity = 200
    airport.capacity = new_capacity
    expect(airport.capacity).to eq new_capacity
  end
  
  it '.weather returns :sunny or :stormy' do
    airport = Airport.new
    expect(airport.weather).to eq(:sunny).or eq(:stormy)
  end

  it '.add(Plane) returns true or false' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.add(plane)).to eq(true).or eq(false)
  end
  
  it '.del(Plane) returns Plane or false' do
    airport = Airport.new
    plane = Plane.new
    airport.add(plane)
    expect(airport.del(plane)).to be_an_instance_of(Plane).or eq(false)
  end

  it '.planes returns array' do
    # TODO: check it's an array of planes
    airport = Airport.new
    plane = Plane.new
    airport.add(plane)
    expect(airport.planes).to be_an_instance_of(Array)
  end

end
