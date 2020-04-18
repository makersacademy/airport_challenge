require 'airport'

describe Airport do

  it 'responds to full?' do
    expect(subject).to respond_to(:full?)
  end
  
  it 'responds to capacity?' do
    expect(subject).to respond_to(:capacity?)
  end
  
  it 'should persists @capacity' do
    expect(assigns(:capacity)).to be_persisted
  end
  
  it 'responds to capacity(number)' do
    expect(subject).to respond_to(:capacity).with(1).argument
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

  it '.capacity? returns positive number' do
    airport = Airport.new
    expect(airport.capacity?).to be >= 0 
  end

  it '.capacity? returns integer' do
    airport = Airport.new
    expect(airport.capacity?).to be_an(Integer) 
  end

end
