require 'airport'

describe Airport do
  let(:airport) {described_class.new}

  describe "#landing", :landing do
    let(:plane) {Plane.new}
    it "instructs a plane to land" do
      airport.instruct_to_land(Plane.new)
      airport.instruct_to_land(Plane.new)
      airport.instruct_to_land(plane)
      expect(airport.plane_arr).to include plane
    end

    it "confirms the plane has landed" do
      airport.instruct_to_land(plane)
      expect(airport.confirm_landed(plane)).to eq "#{plane} has landed."
    end

    it "reports the plane hasn't landed when it hasn't" do
      expect{airport.confirm_landed(plane)}.to raise_error "#{plane} is not in the airport."
    end
  end

  describe "#take_off", :takeoff do
    let(:plane) {Plane.new}
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
      expect{airport.confirm_takeoff(plane2)}.to raise_error "#{plane2} is still in the airport."
    end
  end

  describe "#weather", :weather_tests do
    let(:plane) {Plane.new}
    # NOT USING DOUBLES, JUST STUBS, AS COULDN'T GET WORKING. PROBLEM?
    it "prevents the plane from landing during stormy weather" do
      # set weather to stormy
      allow_any_instance_of(Weather).to receive(:stormy?) { true }
      expect{airport.instruct_to_land(plane)}.to raise_error "Landing not permitted due to stormy weather."
    end

    it "allows the plane to land when weather is NOT stormy" do
      # set weather to NOT stormy
      allow_any_instance_of(Weather).to receive(:stormy?) { false }
      expect(airport.instruct_to_land(plane)).to eq airport.plane_arr
    end

    it "prevents the plane from taking off during stormy weather" do
      # set weather to NOT stormy so plane can land
      allow_any_instance_of(Weather).to receive(:stormy?) { false }
      airport.instruct_to_land(plane)
      # storm occurs while plane is in airport
      allow_any_instance_of(Weather).to receive(:stormy?) { true }
      expect{airport.take_off(plane)}.to raise_error "Takeoff not permitted due to stormy weather."
    end

    it "allows the plane to take off when weather is NOT stormy" do
      # set weather to NOT stormy so plane can land
      allow_any_instance_of(Weather).to receive(:stormy?) { false }
      airport.instruct_to_land(plane)
      expect(airport.take_off(plane)).to eq airport.plane_arr
    end
  end

  # describe "#capacity", :capacity_tests do
  #   let(:plane) {Plane.new}
  #   it "prevents planes from landing when full" do
  #
  #   end
  # end

end
