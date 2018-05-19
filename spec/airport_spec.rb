require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  describe "#land" do

    it "returns a message saying plane has landed" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane has landed"
    end

    it "adds the plane to the hangar" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).not_to be_empty
    end

  end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  describe "#take_off" do

    it "returns a message saying plane has taken off" do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq "Plane has taken off"
    end

    it "removes the plane from the hangar" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).to be_empty
    end

  end

end
