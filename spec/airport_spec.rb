require 'airport'
describe Airport do

  it 'expects airport to be empty' do
    airport1 = Airport.new("JFK Airport")
    expect(airport1.planes == []).to eq true
  end

  it 'should have a default capacity of 20' do
    airport1 = Airport.new("JFK Airport")
    expect(airport1.capacity == 20).to eq true
  end

  it 'should have a capacity of 40' do
    airport1 = Airport.new("LaGuardia Airport", 40)
    expect(airport1.capacity == 40).to eq true
  end
end
