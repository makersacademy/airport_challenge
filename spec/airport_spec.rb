require "airport"

describe Airport do
  #landing a plane
  describe "#land" do
    it 'returns "plane landed" when a plane is landed' do
      plane = Plane.new
      expect(subject.land(plane)).to eq("plane landed")
    end

    #full airport case
    it "returns error if airport is full" do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times{ subject.land(plane) }
      expect{subject.land(plane)}.to raise_error("airport is full")
    end
  end

  #taking off
  describe "#take_off" do
    it 'returns "plane took off" when an available plane takes off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq("plane left airport")
    end

    #empty airport case
    it 'returns "no available planes" when airport is empty' do
      plane = Plane.new
      expect{subject.take_off(plane)}.to raise_error("no available planes")
    end

    #stormy weather case
    
  end
end