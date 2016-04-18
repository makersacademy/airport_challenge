require 'airport'

describe Airport do
  let(:landed_plane){double(:landed_plane, flying:false)}
  let(:flying_plane){double(:flying_plane, flying:true)}


  describe "#initialize" do
    it "initializes with a default capacity" do
      expect(subject.capacity).to be_a(Integer)
    end
    it "has a modifiable capacity" do
      subject.capacity = 1000
      expect(subject.capacity).to eq(1000)
    end
  end

  describe "#planes" do
    it "has an array of to store planes" do
      expect(subject.planes).to be_a(Array)
    end
  end

  describe "#receive_plane" do
    it "adds landing plan to its array" do
      subject.receive_plane(flying_plane)
      expect(subject.planes).to eq([flying_plane])
    end
  end

  describe "#release_plane" do
    it "removes plane taking off from its array" do
      subject.release_plane(flying_plane)
      expect(subject.planes).to eq([])
    end
  end

  describe "#full?" do
    it "returns true if airport is full" do
      subject.capacity = subject.planes.length
      expect(subject.full?).to eq(true)
    end
  end


end
