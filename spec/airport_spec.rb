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

  it 'capacity can be overriden to new value' do
    new_airport = Airport.new("Hamburg")
    new_airport.capacity_override(8)
    expect(new_airport.capacity).to eq(8)
  end

  it 'if string given to capacity_override output error' do
    new_airport = Airport.new("Hamburg")
    expect do new_airport.capacity_override("ten").to output("Capacity not updated.  Method only accepts integers.  Please retry").to_stdout
  end
end

  it 'airport responds to land_plane method' do
    new_airport = Airport.new("Hamburg")
    expect(new_airport).to respond_to(:land_plane)
  end

  it 'airport responds to land_plane with two arguments' do
    new_airport = Airport.new("Hamburg")
    expect(new_airport).to respond_to(:land_plane).with(2).arguments
  end

  it 'airport responds to storm_landing method' do
    new_airport = Airport.new("Hamburg")
    expect(new_airport).to respond_to(:storm_landing)
  end

end
