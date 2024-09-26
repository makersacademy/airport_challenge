require "airport_classes.rb"

describe Airport do

  it "Should instruct planes land in it" do
    my_airport = Airport.new
    allow(my_airport).to receive(:stormy?) { false }

    my_plane = Plane.new

    my_airport.land(my_plane)

    expect(my_airport.runway).to include(my_plane)
  end

  it "Should instruct planes to takeoff and confirm their absence" do
    # Make another airport, instruct a plane to land and then takeoff
    your_airport = Airport.new
    allow(your_airport).to receive(:stormy?) { false }

    your_plane = Plane.new

    your_airport.land(your_plane)

    your_airport.takeoff(your_plane)

    # The plane should not be in the airport, but should exist
    expect(your_airport.runway).not_to include(your_plane)
    expect(your_plane).to be_an_instance_of(Plane)
  end

  it "Should prevent landing when full" do
    full_airport = Airport.new
    allow(full_airport).to receive(:stormy?) { false }

    extra_plane = Plane.new

    # Fill our airport with the default capacity of 10 planes.
    Airport::DEFAULT.times { full_airport.land(Plane.new) }
    # And then try to land another
    full_airport.land(extra_plane)
    # This hopefully fails
    expect(full_airport.runway).not_to include(extra_plane)
  end

  it "Should have working option for custom capacity" do
    # But how about a bigger airport?
    big_airport = Airport.new(20)
    allow(big_airport).to receive(:stormy?) { false }

    welcome_plane = Plane.new
    # Land a number of planes equalling the default capacity
    Airport::DEFAULT.times { big_airport.land(Plane.new) }
    # And then land another. This wouldn't work with default capacity!
    big_airport.land(welcome_plane)
    expect(big_airport.runway).to include(welcome_plane)
  end

  it "Should only allow landing or takeoff in sunny conditions" do
    # In this example, our airport should be fine. Plane lands, no deal!
    stormy_airport = Airport.new
    allow(stormy_airport).to receive(:stormy?) { false }

    safe_plane = Plane.new
    late_plane = Plane.new

    stormy_airport.land(safe_plane)
    # But nothing gets in or out in a storm.
    allow(stormy_airport).to receive(:stormy?) { true }
    # So even a plane was asked to 'takeoff', it will still be in the runway
    stormy_airport.takeoff(safe_plane)
    expect(stormy_airport.runway).to include(safe_plane)
    # Likewise, our other plane can't land now either, so can't be in the runway
    stormy_airport.land(late_plane)
    expect(stormy_airport.runway).not_to include(late_plane)
  end
end
