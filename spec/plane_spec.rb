require 'plane'
require 'pry'

describe Plane do
  let(:airport) { double :airport }
  let(:airport_2) { double :airport_2}
  describe "landing and take off" do
    it "should no longer be flying once landed" do
      allow(airport).to receive(:receive_plane)
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      expect(subject.location).to eq "AIRPORT"
    end

    it "should take off and no longer be at airport" do
      allow(airport).to receive(:stormy?) { false }
      allow(airport).to receive(:receive_plane)
      allow(airport).to receive(:release_plane)
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.location).to eq "AIR"
    end

    it "should not take off if already flying" do
      allow(airport).to receive(:stormy?) { false }
      expect { subject.take_off(airport) }.to raise_error "You are already flying"
    end

    it "should not land if already landed" do
      allow(airport).to receive(:stormy?) { false }
      allow(airport).to receive(:receive_plane)
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error "You are already landed"
    end

    it "should not take off from an airport it is not in" do
      allow(airport).to receive(:stormy?) { false }
      allow(airport_2).to receive(:stormy?) { false }
      allow(airport).to receive(:receive_plane)
      allow(airport_2).to receive(:release_plane) {raise "Plane not in airport"}
      subject.land(airport)
      expect { subject.take_off(airport_2) }.to raise_error "Plane not in airport"
    end
  end

  describe "stormy weather" do
    it "should not take off if it's stormy" do
      allow(airport).to receive(:stormy?) { false }
      allow(airport).to receive(:receive_plane)
      allow(airport).to receive(:release_plane)
      subject.land(airport)
      allow(airport).to receive(:stormy?) { true }
      subject.take_off(airport)
      expect(subject.location).to eq "AIRPORT"
    end

    it "should not land if it's stormy" do
      allow(airport).to receive(:stormy?) { true }
      allow(airport).to receive(:receive_plane)
      subject.land(airport)
      expect(subject.location).to eq "AIR"
    end
  end
end
