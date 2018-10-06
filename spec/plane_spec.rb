require 'plane'
require 'airport'
require 'pry'

describe Plane do
  let(:airport) { double :airport }
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
