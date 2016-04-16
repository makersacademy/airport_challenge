require "airport"

describe Airport do

  it { expect(subject).to respond_to(:take_off) }
  it { expect(subject).to respond_to(:flying?) }

  describe "#take_off" do
    it "returns true when plane has taken off" do
      subject.take_off
      expect(subject).to be_flying
    end

    it "cant be landed whilst flying" do
      plane = Plane.new
      plane.land
      plane.take_off
      expect(plane).to be_flying
      expect(plane).to_not be_landed
    end
  end


end
