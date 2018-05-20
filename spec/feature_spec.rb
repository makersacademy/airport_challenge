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
  it "instructs a plane to take_off and checks if it has" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect { airport.take_off(plane) }.not_to raise_error
    expect(airport.take_off(plane)).to eq plane
  end

# 3rd user story diagram
# Plane <-- stormy? ==> plane doesn't take off when stormy
  it "prevent plane take_off when weather is stormy " do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect { plane.stormy? }.not_to raise_error
    expect(airport.take_off(plane)).not_to be_stormy
  end
end
