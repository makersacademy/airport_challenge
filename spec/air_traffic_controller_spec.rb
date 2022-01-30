require_relative '../lib/air_traffic_controller'

describe AirTrafficController do
  describe '#land' do
    # it { is_expected.to respond_to(:land) }
    it "responds to land" do
      plane = Plane.new("airbourne")
      airport = Airport.new(3,plane)
      atc = AirTrafficController.new
      expect(atc.land(plane, airport)).to eq "Plane landed successfully!"
    end
  end
  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
  end
end
