require 'airport.rb'
require 'plane.rb'

describe Airport do
  plane = Plane.new

  describe "#land" do
    it "respond to #land" do
      #raise exception when stormy!
      #raise exception when full!
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "landing confirmation" do
      #later i will raise an exception so that this doesn't happen
      # the method land won't even run if airport is full.
      expect(subject.land(plane)).to eq("plane landed")
    end
  end

  describe "#takeoff" do
    it "responds to #takeoff" do
      #raise exception when stormy!
      expect(subject).to respond_to(:takeoff).with(1).argument
    end

    it "takeoff confirmation" do
      expect(subject.takeoff(plane)).to eq("plane took off!")
    end
  end


end
