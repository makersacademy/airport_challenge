require_relative "../lib/airport.rb"
describe Airport do
  describe '#land_plane' do
    it "lands a plane and confirm that it is in airport" do
      plane = Plane.new
      weather = Weather.new
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false) # not stormy
      expect(subject.land_plane(plane)).to eq(true)
    end
    it "raises an error if too stormy to land" do
      plane = Plane.new
      weather = Weather.new
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true) # stormy
      expect{subject.land_plane(plane)}.to raise_error("It is too stormy to land")
    end
    it "raises an error if airport is too full" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false) # not stormy
      Airport::DEFAULT_CAPACITY.times do
        subject.land_plane(Plane.new)
      end
      expect{subject.land_plane(Plane.new)}.to raise_error("Airport is full")
    end
    it "raises an error if plane is already at airport" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false) # not stormy
      plane1 = Plane.new
      subject.land_plane(plane1)
      expect{subject.land_plane(plane1)}.to raise_error("Plane is already at airport!")
    end
  end

  describe '#takeoff_plane' do
    it "confirms that the plane has taken off and no longer at airport" do
      plane = Plane.new
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false) # not stormy
      subject.land_plane(plane)
      expect(subject.takeoff_plane(plane)).to eq(true)
    end
    it "raises an error if too stormy to take off" do
      plane = Plane.new
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false) # not stormy
      subject.land_plane(plane)
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true) # now stormy
      expect{subject.takeoff_plane(plane)}.to raise_error("It is too stormy to take off")
    end
    it "raises an error if plane is not at airport" do
      plane = Plane.new
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false) # not stormy
      expect{subject.takeoff_plane(plane)}.to raise_error("Plane is not at airport!")
    end
  end
end
