require 'airport'

describe Airport do

  it 'responds to full?' do
    expect(subject).to respond_to(:full?)
  end
  
  it 'responds to capacity' do
    expect(subject).to respond_to(:capacity)
  end
  
  it 'responds to enter(Plane)' do
    expect(subject).to respond_to(:enter).with(1).argument
  end
  
  it 'responds to exit(Plane)' do
    expect(subject).to respond_to(:exit).with(1).argument
  end

  it 'check for @capacity instance variable' do
    airport = Airport.new
    expect(airport.instance_variable_get(:@capacity))
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

end
