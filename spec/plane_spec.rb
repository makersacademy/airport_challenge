require "plane"
require "airport"
require "weather"

describe Plane do

  context "#land" do

    before(:each) do
      @airport = Airport.new
      allow(@airport.weather).to receive(:stormy?) { false }

      subject.land(@airport)   
    end

    it { is_expected.to respond_to(:land).with(1).arguments }

    it "adds plane to airport" do
      expect(@airport.plane_list.length).to eq 1
    end

    it "sets plane as being at airport" do
      expect(subject.location.class).to eq Airport
    end

    it "raises error if plane is already landed" do
      expect { subject.land(@airport) }.to raise_error "Plane has already landed"
    end

    it "prevented if airport weather is stormy" do
      allow(@airport.weather).to receive(:stormy?) { true }
      expect { subject.land(@airport) }.to raise_error "The weather is too bad to land there"
    end 

  end

  context "#take_off" do
    before(:each) do
      @airport = Airport.new
      allow(@airport.weather).to receive(:stormy?) { false } 
    end

    it { is_expected.to respond_to :take_off }

    it "raises error if not at airport" do
      expect { subject.take_off }.to raise_error "Plane is already in the air!"
    end

    before(:each) do
      subject.land(@airport) 
      subject.take_off
    end

    it "plane location changes" do
      expect(subject.location).to eq "the air"
    end

    it "remove from airport list" do
      expect(@airport.plane_list.length).to eq 0
    end

    it "prevented if airport weather is bad" do
      allow(@airport.weather).to receive(:stormy?).and_return(false, true)
      subject.land(@airport)
      expect { subject.take_off }.to raise_error "The weather is too bad to take off"
    end

  end

end
