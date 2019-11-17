require "airport"
require "weather"

describe Airport do
  #landing a plane
  describe "#land" do
    it 'returns "plane landed" when a plane is landed' do
      allow(Weather).to receive(:stormy?) {false}
      plane = Plane.new
      expect(subject.land(plane)).to eq("plane landed")
    end

    #full airport case
    it "returns error if airport is full" do
      plane = Plane.new
      allow(Weather).to receive(:stormy?) {false}
      Airport::DEFAULT_CAPACITY.times{ subject.land(plane) }
      expect{subject.land(plane)}.to raise_error("airport is full")
    end
  
    #stormy weather case
    it "raises error when too stormy for landing" do
      plane = Plane.new
      allow(Weather).to receive(:stormy?) {true}
      expect{subject.land(plane)}.to raise_error("too stormy for landing")
    end  
  end

  #taking off
  describe "#take_off" do
    it 'returns "plane took off" when an available plane takes off' do
      plane = Plane.new
      allow(Weather).to receive(:stormy?) {false}
      subject.land(plane)
      expect(subject.take_off(plane)).to eq("plane left airport")
    end

    #empty airport case
    it 'returns "no available planes" when airport is empty' do
      plane = Plane.new
      expect{subject.take_off(plane)}.to raise_error("no available planes")
    end

    #stormy weather case
    it "raises error when too stormy for takeoff" do
      plane = Plane.new
      allow(Weather).to receive(:stormy?) {false}
      subject.land(plane)
      allow(Weather).to receive(:stormy?) {true}
      expect{subject.take_off(plane)}.to raise_error("too stormy for takeoff")
    end  
  end
end