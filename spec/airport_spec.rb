require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land) }

  describe "#land" do

    it "notifies that the plane has landed" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane has landed"
    end

    it "adds the plane to the hangar" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).not_to be_empty
    end

  end

  it { is_expected.to respond_to(:take_off) }

  describe "#take_off" do
    it "notifes that the plane has taken off" do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq "Plane has taken off"
    end

    it "removes plane from the hangar" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).to be_empty
    end
  end

end
