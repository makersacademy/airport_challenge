require 'plane'
# require 'airport'

describe Plane do
  it 'reports whether it is airborne' do
    plane = Plane.new
    expect { plane.airborne? }.to_not raise_error
  end

  it 'reports make and serial number when requested' do
    plane = Plane.new("Boeing", 25_817)
    # p plane.registration
    expect(plane.registration).to include(
      :make => "Boeing",
      :serial => 25_817
    )
  end

  it 'can change location' do
    plane = Plane.new("Boeing", 25_817)
    expect { plane.change_location("Sky") }.to_not raise_error
  end
end

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
