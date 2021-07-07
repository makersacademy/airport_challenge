require "plane"

describe Plane do
  it { is_expected.to respond_to(:land) }

  describe "#land" do
    it "lands a plane" do
      expect(subject.land).to eq(:landed)
    end

    it "raises an error if the plane has already landed" do
      subject.land
      expect { subject.land }.to raise_error "Planes already here boss"
    end
  end

  it { is_expected.to respond_to(:take_off) }

  describe "#take_off" do
    it "allows the plane to take off" do
      expect(subject.take_off). to eq(:flying)
    end

    it "raises and error if plane is already in the air" do
      subject.land
      subject.take_off
      expect { subject.take_off }.to raise_error "Planes already in the sky boss"
    end
  end
end