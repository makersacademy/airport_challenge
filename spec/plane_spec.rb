require "plane"

describe Plane do
  let(:airport) { double :airport }
  before :each do
    allow(airport).to receive(:land)
    allow(airport).to receive(:take_off)
  end
  let(:weather) { double :weather, stormy?: false }

  let(:wrong_airport) { double :wrong_airport }

  describe "#land_at" do
    it "lands in the airport" do
      subject.land_at(airport)
      expect(subject).not_to be_flying
    end
  end

  describe "#depart_from" do
    it "takes off from the airport" do
      subject.land_at(airport)
      subject.depart_from(airport)
      expect(subject).to be_flying
    end

    it "only departs from the airport it is in" do
      airport.land(subject)
      expect { subject.depart_from(wrong_airport) }.to raise_error "Wrong airport"
    end
  end
end
