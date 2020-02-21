require './lib/airport'
require './lib/plane.rb'
#As an air traffic controller
#So I can get passengers to a destination
#I want to instruct a plane to land at an airport

describe Airport do
it 'tells the plane to land at the airport' do
  airport = Airport.new
  expect(airport.land("plane")).to eq "plane has landed"
  #you needed to call airport because its a class of airport
  #go by the syntax you use in IRB
end
end
describe Airport do
  it "prevents landing when airport is full" do
    airport.Airport.new
    expect(plane.land)to raise_error
end
#  expect {subject.release_bike}.to raise_error 'no bikes available'
