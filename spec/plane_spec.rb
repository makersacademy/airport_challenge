require "plane"
require "airport"

describe Plane do

  # let(:airport) { double :Airport, :stormy? => false, :full? => false, plane_list: [] }

  describe "#land" do

    it { is_expected.to respond_to(:land).with(1).arguments }

    it "adds plane to airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      expect(airport.plane_list.length).to eq 1
    end

    it "sets plane as being at airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      expect(subject.location.class).to eq Airport
    end

    it "raises error if plane is already landed" do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error "Plane has already landed"
    end

    it "prevented if airport weather is stormy" do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { true }
      expect { subject.land(airport) }.to raise_error "The weather is too bad to land there"
    end 

  end

  describe "#take_off" do
    it { is_expected.to respond_to :take_off }

    it "raises error if not at airport" do
      expect { subject.take_off }.to raise_error "Plane is already in the air!"
    end

    it "plane location changes" do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      subject.take_off
      expect(subject.location).to eq "the air"
    end

    it "remove from airport list" do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      subject.take_off
      expect(airport.plane_list.length).to eq 0
    end

    it "prevented if airport weather is bad" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false, true)
      subject.land(airport)
      expect { subject.take_off }.to raise_error "The weather is too bad to take off"
    end

  end

end
