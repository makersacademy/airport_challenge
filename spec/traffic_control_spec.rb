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
        airport1.land(plane1)
        plane1.land(airport1)
        expect( subject.take_off(plane1,airport1) ).to eq "in-air"
      end

    end
    context "when plane not flying" do
      it "plane can take_off and location in-air" do
        airport1.land(plane1)
        plane1.land(airport1)
        expect( subject.take_off(plane1,airport1)).to eq "in-air"
      end
    end
  end

  describe "#land" do
    context "When plane not flying" do
      it "plane cannot land as not flying error" do
        airport1.land(plane1)
        plane1.land(airport1)
        expect{ subject.land(plane1,airport1) }.to raise_error("Plane not flying so cannot land")
      end
      it "plane location is a airport" do
        airport1.land(plane1)
        plane1.land(airport1)
        expect(plane1.location).to eq airport1
      end
    end
    context "When plane flying" do
      it "plane can land" do
        airport1.land(plane1)
        airport1.take_off(plane1)
        plane1.take_off
        expect(subject.land(plane1,airport1)).to eq airport1
      end
    end
  end

end