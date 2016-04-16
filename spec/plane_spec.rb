require  "plane"

describe Plane do

  it { expect(subject).to respond_to(:land) }
  it { expect(subject).to respond_to(:landed?) }

  describe "#land" do
    it "returns true when plane has landed" do
      subject.land
      expect(subject).to be_landed
    end

  end

end
