# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

require 'airport.rb'
require 'plane.rb'

describe Airport do
  it 'instruct plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq [plane]
  end

  it 'raises an error if airport is full' do
    airport = Airport.new
    expect{ airport.land }.to raise_error 'airport is full'
  end

  it 'plane take off and confirm' do
    airport = Airport.new
    expect(airport.take_off).to eq("Plane taken off! No longer at airport.")
  end

  it 'raises an error if no planes to take off' do
    airport = Airport.new
    expect{ airport.take_off }.to raise_error "No planes available"
  end

  it 'airport full' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.airport_full).to eq(true)
  end

end
