require 'Airport.rb'
describe Airport do

  it 'airport can be named' do
    new_airport = Airport.new("Hamburg")
    expect(new_airport.name).to eq("Hamburg")
  end

  it 'plane array empty' do
    new_airport = Airport.new("Hamburg")
    expect(new_airport.planes_in_airport).to eq([])
  end

  it 'default airport capacity = 5' do
    new_airport = Airport.new("Hamburg")
    expect(new_airport.capacity).to eq(5)
  end

  it 'airport reponds to capacity_override method' do
    new_airport = Airport.new("Hamburg")
    expect(new_airport).to respond_to(:capacity_override)
  end

  it 'airport responds to capacity_override with argument' do
    new_airport = Airport.new("Hamburg")
    expect(new_airport).to respond_to(:capacity_override).with(1).argument
  end



end
