require "airport_classes.rb"

describe Airport do

  it "Should have planes land in it" do
    my_airport = Airport.new
    my_plane = Plane.new
    my_plane.land(my_airport)
    expect(my_airport.runway).to include(my_plane)
  end
end
