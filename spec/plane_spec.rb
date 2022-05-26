require './lib/plane.rb'
describe Plane do
  it "Allow the traffic officer to land a plane" do
    # what the outcome should be
    plane = Plane.new 
    # creating a new plane instance to compare against
    expect(plane).to respond_to(:land_plane)
  end

  it "Allow plane to take off and say the airport is empty" do
   # plane has to take off from the airport
    plane = Plane.new
    expect(plane).to respond_to(:takeoff)
#     # passenger of subject (subject being the plane) to land
#     expect(passenger).to respond_to(:arrived?)
  end
end 
# need to add a test to see if passengers are in the plane
# if yes then passengers have arrived
# need to use require to allow the Plane class to see the Passenger one.
