require "airport"

# Commented-out tests are redundant, I've left them in here to show my progress.

describe Airport do
  let(:airport) { described_class.new }

  # it "Has a default capacity if one is not set by the user" do
  #   expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  # end

  it "sets the capacity to another number if passed as an argument" do
    expect(Airport.new(300).capacity).to eq 300
  end

  it "raises an error if the capacity passed is not an integer" do
    message = "The capacity specified was not a number!"
    expect { Airport.new("a string instead of an integer") }.to raise_error message
  end

  it "raises an error if the capacity specified is negative" do
    message = "The capacity must be a positive number!"
    expect { Airport.new(-256) }.to raise_error message
  end

  # it "should have a @weather variable that is an instance of Weather" do
  #   expect(airport.weather).to satisfy { |weather| weather.is_a?(Weather) }
  # end

  describe '#land' do
    let(:plane) { Plane.new }
    let(:weather) { double(:weather) }

    # it "should add a plane to the hangar" do
    #   airport.weather.current_state = :sunny
    #   airport.land(plane)
    #   expect(airport.hangar).to include plane
    # end

    it "should raise an error if trying to land something other than a plane" do
      message = "That's not a plane! It can't land here!"
      expect { airport.land("not a plane") }.to raise_error message
    end

    it "should raise an error if trying to land a plane at a full airport" do
      message = "Sorry, this airport is full! Bye!"
      airport.weather.current_state = :sunny
      100.times { airport.land(Plane.new) }
      expect { airport.land(plane) }.to raise_error message
    end

    it "should raise an error when trying to land in stormy weather" do
      message = "Cannot land in stormy weather!"
      airport.weather.current_state = :stormy
      expect { airport.land(plane) }.to raise_error message
    end

  end

  describe "#takeoff" do
    let(:plane) { Plane.new }

    # it "responds to .takeoff" do
    #   expect(airport).to respond_to(:takeoff)
    # end

    # it "should remove a plane from the hangar" do
    #   airport.weather.current_state = :sunny
    #   airport.hangar << plane
    #   airport.takeoff(plane)
    #   expect(airport.hangar).to eq []
    # end

    it "should remove the specific plane passed as an argument" do
      airport.weather.current_state = :sunny
      specific_plane = Plane.new("this plane is special")
      airport.land(specific_plane)
      3.times { airport.land(Plane.new) }
      airport.takeoff(specific_plane)
      expect(airport.hangar).not_to include(specific_plane)
    end

    it "should remove the last plane if nothing is passed" do
      airport.weather.current_state = :sunny
      20.times { airport.land(Plane.new) }
      last_plane = airport.hangar.last
      expect(airport.takeoff).not_to include(last_plane)
    end

    it "should raise an error when the weather is stormy" do
      airport.weather.current_state = :sunny
      airport.land(plane)
      message = "Cannot take off in stormy weather!"
      airport.weather.current_state = :stormy
      expect { airport.takeoff(plane) }.to raise_error message
    end
  end

end
