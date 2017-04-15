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

end
