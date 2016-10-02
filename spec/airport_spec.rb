require 'airport'
require 'plane'

describe Airport do

before do
  @airport = Airport.new
end

  it "should instruct a plane to land and confirm it has landed" do
     expect(@airport).to respond_to(:land)
   end

   it "should instruct a plane to take off and confirm it's no longer at the airport" do
     expect(@airport).to respond_to(:take_off)
   end

   it "should prevent landing when the airport is full" do
     Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
     expect{airport.land(plane)}.to raise_error "Sorry, the airport is full so you cannot land"
   end
 end
