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

    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy

    it "refuses to allow planes to take off if the weather is stormy" do
      weather = Weather.new
    end

  end

end
