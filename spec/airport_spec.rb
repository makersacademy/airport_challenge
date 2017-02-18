require 'airport'

describe Airport do
  let(:airport) {described_class.new}

  describe "#landing", :landing do
    let(:plane) {Plane.new}
    it "instructs a plane to land" do
      expect(airport.instruct_to_land(plane)).to eq plane
    end

    it "confirms the plane has landed" do
      airport.instruct_to_land(plane)
      expect(airport.confirm_landed(plane)).to eq "#{plane} has landed."
    end

    it "reports the plane hasn't landed when it hasn't" do
      expect{airport.confirm_landed(plane)}.to raise_error "There are no planes at the airport."
    end
  end

  # describe "#take_off", :takeoff do
  #   it "instructs a plane to take off" do
  #     expect(airport.take_off(plane)).to eq plane
  #   end
  #
  #   it "confirms the plane has taken off" do
  #     expect(airport.confirm_takeoff).to eq "#{plane} has taken off."
  #   end
  #
  #   it "reports the plane hasn't taken off when it hasn't" do
  #     expect{airport.confirm_takeoff}.to raise_error "Plane has not taken off"
  #   end
  #
  # end


end
