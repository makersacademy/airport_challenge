require './lib/traffic_control'

describe TrafficControl do
  let(:plane1) {Plane.new}
  let(:airport1) {Airport.new}

  describe "#take_off" do
    context "when plane flying" do
      it "error flying plane can't take-off" do
        expect { subject.take_off(plane1,airport1) }.to raise_error("Plane flying so cannot take_off")
      end
      it "plane location to be in-air" do
        airport1.lands(plane1)
        plane1.location = airport1
        plane1.status = "not-flying"
        expect( subject.take_off(plane1,airport1) ).to eq "in-air"
      end

    end
    context "when plane not flying" do
      it "plane can take_off and location in-air" do
        airport1.lands(plane1)
        plane1.location = airport1
        plane1.status = "not-flying"
        expect( subject.take_off(plane1,airport1) ).to eq "in-air"
      end
    end
  end

  describe "#land" do
  end

end