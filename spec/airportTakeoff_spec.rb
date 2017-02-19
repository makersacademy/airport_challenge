require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { Plane.new }

  before do
    allow_any_instance_of(Weather).to receive(:stormy?) { false }
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
end
