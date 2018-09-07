require 'airport'

describe Airport do

  describe "#land_plane" do
    it "should instruct a plane to land" do
      expect(subject.land_plane).to eq "Land plane"
    end
  end

  describe "#take_off" do
    it "should instruct a plane to take off" do
      expect(subject.take_off).to eq "Take off from airport"
    end
  end

  describe "#in_airport?" do
    it "should return true if plane is in airport" do
      expect(subject.in_airport?).to eq true
    end
  end

  describe "#stormy?" do
    it "should return true if weather is stormy" do
      expect(subject.stormy?).to eq true
    end
  end

  describe "#airport_full?" do
    it "should return true if airport is full" do
      expect(subject.airport_full?).to eq true
    end
  end

end
