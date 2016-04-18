require  "plane"

describe Plane do

  let(:airport) {double :airport}
  subject(:plane) {described_class.new}

  describe "#land" do
    it "returns true when plane has landed" do
      subject.land
      expect(subject).to be_in_airport
    end

    it "cant be flying whilst in airport." do
      subject.take_off
      subject.land
      expect(subject.in_airport?).to be true
    end

  end

  describe "#take_off" do
    it "returns true when plane has taken off" do
      subject.take_off
      expect(subject).to_not be_in_airport
    end

    it "cant be landed whilst flying" do
      subject.land
      subject.take_off
      expect(subject.in_airport?).to be false
    end
  end

end
