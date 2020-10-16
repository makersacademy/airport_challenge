require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'
# feature test to land and take off multiple planes
describe "bonus feature test" do
  it "lands and takes off multpile planes" do
    airport = Airport.new(5)
    allow(airport.weather).to receive(:rand).and_return(1)
    planes = []
    airport.capacity.times { planes << Plane.new }
    planes.each { |plane| airport.land(plane) }
    expect(airport.hangar.size).to eq 5
    # taking off planes
    planes.each { |plane| airport.take_off(plane) }
    expect(airport.hangar.size).to eq 0
  end
end
