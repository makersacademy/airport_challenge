require 'airport'

describe Airport do
  let(:airport) {described_class.new}
  let(:plane) {Plane.new}

  before do
    allow_any_instance_of(Weather).to receive(:stormy?) { false }
  end

  describe "#landing", :landing do
    it "instructs a plane to land" do
      airport.instruct_to_land(plane)
      expect(airport.plane_arr).to include plane
    end

    it "confirms the plane has landed" do
      airport.instruct_to_land(plane)
      expect(airport.confirm_landed(plane)).to eq "#{plane} has landed."
    end

    it "reports the plane hasn't landed when it hasn't" do
      message = "#{plane} is not in the airport."
      expect{airport.confirm_landed(plane)}.to raise_error message
    end
  end

  describe "#take_off", :takeoff do
    it "instructs a plane to take off" do
      airport.instruct_to_land(plane)
      airport.take_off(plane)
      expect(airport.plane_arr).not_to include plane
    end

    it "confirms the plane has taken off" do
      expect(airport.confirm_takeoff(plane)).to eq "#{plane} has taken off."
    end

    it "reports the plane hasn't taken off when it hasn't" do
      plane2 = Plane.new
      airport.instruct_to_land(plane2)
      message = "#{plane2} is still in the airport."
      expect{airport.confirm_takeoff(plane2)}.to raise_error message
    end
  end

  describe "#weather", :weather_tests do
    it "prevents the plane from landing during stormy weather" do
      # set weather to stormy
      allow_any_instance_of(Weather).to receive(:stormy?) { true }
      message = "Landing not permitted due to stormy weather."
      expect{airport.instruct_to_land(plane)}.to raise_error message
    end

    it "allows the plane to land when weather is NOT stormy" do
      expect(airport.instruct_to_land(plane)).to eq airport
    end

    it "prevents the plane from taking off during stormy weather" do
      airport.instruct_to_land(plane)
      # storm occurs while plane is in airport
      allow_any_instance_of(Weather).to receive(:stormy?) { true }
      message = "Takeoff not permitted due to stormy weather."
      expect{airport.take_off(plane)}.to raise_error message
    end

    it "allows the plane to take off when weather is NOT stormy" do
      airport.instruct_to_land(plane)
      expect(airport.take_off(plane)).to eq airport.plane_arr
    end
  end

  describe "#capacity", :capacity_tests do
    it "prevents planes from landing when airport is full" do
      Airport::DEFAULT_CAPACITY.times{airport.instruct_to_land(Plane.new)}
      message = "Landing not permitted as max capacity has been reached."
      expect{airport.instruct_to_land(plane)}.to raise_error message
    end

    it "sets the capacity of the airport to a given value" do
      bigger_airport = Airport.new(50)
      expect(bigger_airport.capacity).to eq(50)
    end

    it "allows default capacity to be overridden" do
      bigger_airport = Airport.new(50)
      49.times{bigger_airport.instruct_to_land(Plane.new)}
      expect(bigger_airport.instruct_to_land(Plane.new)).to eq bigger_airport
      # SHOULD I ACTUALLY TEST FOR LENGTH OF PLANE ARRAY?
    end
  end

end
