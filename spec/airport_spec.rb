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
      allow(subject).to receive(:rand).and_return(0.8) # not stormy
      expect(subject.land_plane(plane)).to eq(plane)
    end
    it "raises an error if too stormy to land" do
      plane = Plane.new
      allow(subject).to receive(:rand).and_return(0.05) # stormy
      expect{subject.land_plane(plane)}.to raise_error("It is too stormy to land")
    end
    it "raises an error if airport is too full" do
      plane = Plane.new

      allow(subject).to receive(:rand).and_return(0.8) # not stormy
      expect{subject.land_plane(plane)}.to raise_error("Airport is full")
    end
  end

  describe '#takeoff_plane' do
    it "Airport responded to #takeoff_plane" do
      expect(subject).to respond_to(:takeoff_plane)
    end
    it "confirms that the plane has taken off" do
      plane = Plane.new
      allow(subject).to receive(:rand).and_return(0.8) # not stormy
      subject.land_plane(plane)
      expect(subject.takeoff_plane).to eq(true)
    end

    it "raises an error if too stormy to take off" do
      plane = Plane.new
      allow(subject).to receive(:rand).and_return(0.8) # not stormy
      subject.land_plane(plane)
      allow(subject).to receive(:rand).and_return(0.05) # now stormy
      expect{subject.takeoff_plane}.to raise_error("It is too stormy to take off")
    end
  end

  describe "#confirm_takeoff_plane" do
    it "Airport responded to #confirm_takeoff_plane" do
      expect(subject).to respond_to(:confirm_takeoff_plane)
    end
    it "takes an argument" do
      expect(subject).to respond_to(:confirm_takeoff_plane).with(1).argument
    end
    it "returns true if a plane has taken off" do
      plane = Plane.new
      allow(subject).to receive(:rand).and_return(0.8) # not stormy
      subject.land_plane(plane)
      subject.takeoff_plane
      expect(subject.confirm_takeoff_plane(plane)).to eq true
    end
    it "returns false if a plane has taken off" do
      plane = Plane.new
      allow(subject).to receive(:rand).and_return(0.8) # not stormy
      subject.land_plane(plane)
      expect(subject.confirm_takeoff_plane(plane)).to eq false
    end
  end

  describe '#stormy?' do
    it "Airport class responded to stormy?" do
      expect(subject).to respond_to(:stormy?)
    end
    it "Returns false if #rand is 0.8 (0.8 < 0.1)" do
      allow(subject).to receive(:rand).and_return(0.8) # not stormy
      expect(subject.stormy?).to eq false
    end
    it "Returns true if #rand is 0.05 (0.8 < 0.1)" do
      allow(subject).to receive(:rand).and_return(0.05) # stormy
      expect(subject.stormy?).to eq true
    end
  end

  describe '#full?' do
    it "Airport class responds to full?" do
      expect(subject).to respond_to(:full?)
    end
    it "returns true if airport if full" do
      Airport::DEFAULT_CAPACITY.times do
        station.land_plane Plane.new
      end
      expect(subject.full?).to eq true
    end
    it "returns false if airport is not full" do

      expect(subject.full?).to eq false
    end
  end


end

describe Plane do

end