require "airport_classes.rb"

describe Airport do

  it "Should instruct planes land in it" do
    my_airport = Airport.new
    my_plane = Plane.new
    my_airport.land(my_plane)
    expect(my_airport.runway).to include(my_plane)
  end

  it "Should instruct planes to takeoff and confirm their absence" do
    your_airport = Airport.new
    your_plane = Plane.new
    your_airport.land(your_plane)
    your_airport.takeoff(your_plane)
    expect(your_airport.runway).not_to include(your_plane)
    expect(your_plane).to be_an_instance_of(Plane)
  end
end
