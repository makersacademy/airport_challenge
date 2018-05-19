describe 'user stories diagrams' do
# 1st user story diagram
# Airport <-- land(plane) ==> the plane lands at the airport
  it "instructs the plane to land at the airport" do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

# 2nd user story diagram
# Airport <-- take_off(plane) => the plane takes off from the airport/check to see it's not in the airport anymore
  it "instructs a plane to take off and checks if it has" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off).to eq plane
    expect { airport.take_off }.not_to raise_error
  end
end
