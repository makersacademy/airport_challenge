require 'airport'

describe Airport do
  let(:landed_plane){double(:landed_plane, :flying => false)}
  let(:flying_plane){double(:flying_plane, :flying => true)}


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

  describe "#request_land" do
    it {is_expected.to respond_to(:request_land).with(1).argument}

    it "tells a plane to land" do
      expect(flying_plane).to receive(:land)
      subject.request_land(flying_plane)
    end
  end

  describe "#request_takeoff" do
    it {is_expected.to respond_to(:request_takeoff).with(1).argument}

    it "tells a plane to take off" do
      expect(landed_plane).to receive(:takeoff)
      subject.request_takeoff(landed_plane)
    end

  end
end
