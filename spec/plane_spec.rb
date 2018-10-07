require 'plane'

describe Plane do

  let(:airport) { double :airport }
  let(:airport_2) { double :airport_2 }

  describe "landing and take off" do
    it "should be able to land and no longer be flying" do
      airport = double(:airport, full?: false, stormy?: false)
      allow(airport).to receive(:receive_plane)
      subject.land(airport)
      expect(subject.location).to eq "AIRPORT"
    end

    it "should take off and no longer be at airport" do
      airport = double(:airport, full?: false, stormy?: false)
      allow(airport).to receive(:receive_plane)
      allow(airport).to receive(:release_plane)
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.location).to eq "AIR"
    end
  end

  context "edge cases" do
    it "should not take off if already flying" do
      airport = double(:airport, full?: false, stormy?: false)
      expect { subject.take_off(airport) }.to raise_error "You are already flying"
    end

    it "should not land if already landed" do
      airport = double(:airport, full?: false, stormy?: false)
      allow(airport).to receive(:receive_plane)
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error "You are already landed"
    end

    it "should not take off from an airport it is not in" do
      airport = double(:airport, full?: false, stormy?: false)
      airport_2 = double(:airport, full?: false, stormy?: false)
      allow(airport).to receive(:receive_plane)
      allow(airport_2).to receive(:release_plane) { raise "Plane not in airport" }
      subject.land(airport)
      expect { subject.take_off(airport_2) }.to raise_error "Plane not in airport"
    end

    it "should not land when airport is full" do
      airport = double(:airport, full?: true, stormy?: false)
      allow(airport).to receive(:receive_plane)
      expect { subject.land(airport) }.to raise_error "Airport full"
    end
  end

  context "stormy weather" do
    it "should not take off if it's stormy" do
      airport = double(:airport, full?: false, stormy?: false)
      allow(airport).to receive(:receive_plane)
      allow(airport).to receive(:release_plane)
      subject.land(airport)
      allow(airport).to receive(:stormy?) { true }
      subject.take_off(airport)
      expect(subject.location).to eq "AIRPORT"
    end

    it "should not land if it's stormy" do
      airport = double(:airport, full?: false, stormy?: true)
      allow(airport).to receive(:receive_plane)
      subject.land(airport)
      expect(subject.location).to eq "AIR"
    end
  end
end
