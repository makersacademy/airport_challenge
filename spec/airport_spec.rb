require 'airport'

describe Airport do
  let(:airport) {described_class.new}

  describe "#landing", :landing do
    let(:plane) {Plane.new}
    it "instructs a plane to land" do
      airport.instruct_to_land(plane)
      expect(airport.plane).to eq plane
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
    it "instructs a plane to take off", :instructs_takeoff do
      airport.instruct_to_land(plane)
      expect(airport.take_off(plane)).to eq airport.plane_arr.delete_if  { |p| p == plane }
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


end
