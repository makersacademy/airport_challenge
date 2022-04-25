require 'airport'
describe Airport do
  it 'can create a new instance of airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it 'can store instances of planes' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.planes).to eq([])
  end 

  it 'has a default capacity of planes' do
    airport = Airport.new
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it 'generates local weather when initializing' do
    airport = Airport.new
    allow(@weather).to receive(:dice) { 3 }
  end 
end
