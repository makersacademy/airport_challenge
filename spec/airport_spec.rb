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
 end
