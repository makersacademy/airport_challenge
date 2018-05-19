require 'airport'

describe Airport do

  describe "#let_plane_land" do
    it "checks plane has landed in airport" do
      plane = Plane.new
      subject.let_plane_land(plane)
      expect(subject.planes.last).to eq plane
    end
  end

  describe "#take_off" do

    it "checks plane has taken off from airport" do
      plane = Plane.new
      subject.let_plane_land(plane)
      # let airport have sunny weather
      allow(subject).to receive(:weather).and_return(:sunny)
      expect(subject.take_off).to eq plane
    end

    it "checks plane is no-longer in airport" do
      plane = Plane.new
      subject.let_plane_land(plane)
      # let airport have sunny weather
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.take_off
      expect(subject.planes.include?(plane)).to eq false
    end

    it "should raise error if weather is stormy" do
      plane = Plane.new
      subject.let_plane_land(plane)
      # let airport have weather that is stormy
      allow(subject).to receive(:weather).and_return(:stormy)
      expect{subject.take_off}.to raise_error "cannot take off due to stormy weather"
    end

  end

  describe "#weather" do

    it "expects airport to respond to weather" do
      expect(subject).to respond_to(:weather)
    end

  end

end
