require  "plane"

describe Plane do

  let(:airport) {double :airport}

  it { expect(subject).to respond_to(:land) }
  it { expect(subject).to respond_to(:landed?) }
  it { expect(subject).to respond_to(:take_off) }


  describe "#land" do
    it "returns true when plane has landed" do
      subject.land
      expect(subject).to be_landed
    end

    it "cant be flying whilst 'landed'." do
      subject.take_off
      subject.land
      expect(subject.landed?).to be true
    end

  end

  describe "#take_off" do
    it "returns true when plane has taken off" do
      subject.take_off
      expect(subject).to_not be_landed
    end

    it "cant be landed whilst flying" do
      subject.land
      subject.take_off
      expect(subject.landed?).to be false
    end
  end

end
