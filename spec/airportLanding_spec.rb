require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { Plane.new }

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

    context "checking error is raised when plane hasn't landed" do
      it "reports the plane hasn't landed when it hasn't" do
        message = "#{plane} is not in the airport."
        expect{airport.confirm_landed(plane)}.to raise_error message
      end
    end
  end
end
