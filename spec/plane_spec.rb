require 'plane'

describe Plane do
  let(:plane) { Plane.new("Boeing", 25_817) }

  it 'reports whether it is airborne' do
    plane.change_location("Sky")
    expect(plane.airborne?).to eq true
  end

  it 'reports make and serial number when requested' do
    expect(plane.registration).to include(
      :make => "Boeing",
      :serial => 25_817
    )
  end
end

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
