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
      expect(subject.land_plane(plane)).to eq(plane)
    end
  end

  describe '#takeoff_plane' do
    it "Airport responded to #takeoff_plane" do
      expect(subject).to respond_to(:takeoff_plane)
    end
    it "confirms that the plane has taken off" do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.takeoff_plane).to eq(true)
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
      subject.land_plane(plane)
      subject.takeoff_plane
      expect(subject.confirm_takeoff_plane(plane)).to eq true
    end
    it "returns false if a plane has taken off" do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.confirm_takeoff_plane(plane)).to eq false
    end
  end


end

describe Weather do
  describe '#random?' do
    it "Weather class responded to stormy?" do
      expect(subject).to respond_to(:stormy?)
    end
    it "Returns false if #rand is 0.8 (0.8 < 0.1)" do
      expect(subject).to receive(:rand).and_return(0.8)
      expect(subject.stormy?).to eq false
    end
    it "Returns true if #rand is 0.05 (0.8 < 0.1)" do
      expect(subject).to receive(:rand).and_return(0.05)
      expect(subject.stormy?).to eq true
    end
  end
end

describe Plane do

end