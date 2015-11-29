require './lib/airport.rb'

describe Plane do
  let(:airport1) {Airport.new}

  describe "#status" do
    context "when plane on ground" do
      it "sets plane status not-flying" do
        subject.land(airport1)
        expect(subject).not_to be_flying
      end
    end
    context "when plane flying" do
      it "sets plane status flying" do
        subject.take_off
        expect(subject).to be_flying
      end
    end
  end
  describe "#location" do
    context "when plane on ground" do
      it "sets plane location airport" do
        subject.land(airport1)
        expect(subject.location).to eq airport1
      end
    end
    context "when plane flying" do
      it "sets plane location in-air" do
        subject.take_off
        expect(subject.location).to eq "in-air"
      end
    end
  end

end