require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
# This test checks that new Airport
# class instances can be made
  it 'can create a new instance of the Airport class' do
    airport = Airport.new
    expect(airport).to be_a(Airport)
  end
 # This test checks that instances of the
 # Plane class can be stored within an
 # instance of the Airport class 
  it 'can instuct planes to land at an airport' do
  airport = Airport.new
  expect(airport.planes.length).to eq 1
  end
end