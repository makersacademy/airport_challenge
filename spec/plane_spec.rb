require "plane"
require "airport"

describe Plane do 

  describe "#land" do
    it { should respond_to(:land).with(1).arguments }

    it "adds plane to airport" do
      airport = Airport.new
      subject.land(airport)
      expect(airport.plane_list.length).to eq 1
    end

    it "sets plane as being at airport" do
      airport = Airport.new
      subject.land(airport)
      expect(subject.location.class).to eq Airport
    end

    it "raises error if plane is already landed" do
      airport = Airport.new
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error "Plane has already landed"
    end

    it "prevented if airport weather is stormy" do
      airport = double(:Airport, :stormy? => true, :full? => false, plane_list: [])
      expect { subject.land(airport) }.to raise_error "The weather is too bad to land there"
    end 

  end

  describe "#take_off" do
    it { should respond_to :take_off }

    it "raises error if not at airport" do
      expect { subject.take_off }.to raise_error "Plane is already in the air!"
    end

    it "plane location changes" do
      subject.land(Airport.new)
      subject.take_off
      expect(subject.location).to eq "the air"
    end

    it "remove from airport list" do
      airport = Airport.new
      subject.land(airport)
      subject.take_off
      expect(airport.plane_list.length).to eq 0
    end

    it "prevented if airport weather is bad" do
      airport = double(:Airport, :full? => false, plane_list: [])
      allow(airport).to receive(:stormy?).and_return(false, true)
      subject.land(airport)
      
      
      expect { subject.take_off }.to raise_error "The weather is too bad to take off"
    end

  end

end
