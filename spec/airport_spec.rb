require_relative "../lib/airport.rb"
describe Airport do

  describe '#land_plane' do
    it "Airport responded to #land_plane" do
      expect(subject).to respond_to(:land_plane)
    end
    it "takes an argument" do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end
    it "lands a plane" do
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
    it "Airport responded to #takeoff_plane" do
      expect(subject).to respond_to(:takeoff_plane)
    end
    it "confirms that the plane has taken off" do
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
  end

  describe "#at_airport?" do
    it "Airport responded to #confirm_takeoff_plane" do
      expect(subject).to respond_to(:at_airport?)
    end
    it "takes an argument" do
      expect(subject).to respond_to(:at_airport?).with(1).argument
    end
    it "returns false if plane is not at airport" do
      plane = Plane.new
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false) # not stormy
      subject.land_plane(plane)
      subject.takeoff_plane(plane)
      expect(subject.at_airport?(plane)).to eq false
    end
    it "returns true if plane is at airport" do
      plane = Plane.new
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false) # not stormy
      subject.land_plane(plane)
      expect(subject.at_airport?(plane)).to eq true
    end
  end



  describe '#full?' do
    it "Airport class responds to full?" do
      expect(subject).to respond_to(:full?)
    end
    it "returns true if airport is full" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false) # not stormy
      Airport::DEFAULT_CAPACITY.times do
        subject.land_plane(Plane.new)
      end
      expect(subject.full?).to eq true
    end
    it "returns false if airport is not full" do

      expect(subject.full?).to eq false
    end
  end
end
