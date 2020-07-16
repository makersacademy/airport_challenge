require './lib/airport'
require './lib/plane.rb'
#As an air traffic controller
#So I can get passengers to a destination
#I want to instruct a plane to land at an airport

describe Airport do
it 'tells the plane to land at the airport' do
  airport = Airport.new
  expect(airport.land(:plane)).to eq "plane has landed"
  #you needed to call airport because its a class of airport
  #go by the syntax you use in IRB
end
end
describe Airport do
  it "prevents landing when airport is full" do
    airport = Airport.new
    airport.capacity.times{ airport.land Plane.new }
    #aiport.land they need to be called together because times is not associated
    #with any of the classes
    expect{ airport.land Plane.new }.to raise_error "airport is fullzzzz"
    #have to call the method next to expect as well
 end
end

describe 'initilization' do
  it 'has a variable capacity' do
    airport = Airport.new(10)
10.times { airport.land Plane.new }
#expect(10).to eq(10)
expect{ airport.land Plane.new }.to raise_error "airport is fullzzzz"
  end
end
#expect(actual).to be(expected)

describe Airport do
  let (:plane) {Plane.new}
  it 'defaults capacity' do
    airport = Airport.new
    described_class::DEFAULT_CAPACITY.times do
      airport.land(:plane)
      end
      expect{ airport.land(:plane) }.to raise_error "airport is fullzzzz"
    end
end

#As an air traffic controller
#To ensure safety
#I want to prevent takeoff when weather is stormy

describe "story weather outcomes" do
  it 'generates stormy weather' do
    airport = Airport.new
    plane = double(:plane, stormy?: true)
    #allow{ (airport).to receive.weather_land }.and_return(5)
    expect{ airport.weather_land }.to raise_error "Too stormy!"
  end

#describe "second stormy weather outcome" do
it 'generates stormy weather and prevents landing'do
  airport = Airport.new
  plane = double(:plane, stormy?: true)
  expect{ airport.weather_takeoff }.to raise_error "Too stormy to take off"
 end
#end
end
