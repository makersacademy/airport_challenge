require  "plane"

describe Plane do

  let(:airport) {double :airport}

  it { expect(subject).to respond_to(:land) }
  it { expect(subject).to respond_to(:landed?) }

  describe "#land" do
    it "returns true when plane has landed" do
      subject.land
      expect(subject).to be_landed
    end

    it "cant be flying whilst 'landed'." do
      subject.take_off
      subject.land
      expect(subject).to be_landed
      expect(subject).to_not be_flying
    end

  end

end
