require 'plane'

describe Plane do

  let(:airport) { double(:airport) }

  context "land the plane" do

    it "should be able to respond to land method" do
      expect(subject).to respond_to :land
    end

    it "should land the plane at an airport" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "should be able to respond to landed? method" do
      expect(subject).to respond_to :landed?
    end

    it "should be able to land at an airport and confirm it's landed" do
      allow(airport).to receive(:park_plane)
      subject.land(airport)
      expect(subject).to be_landed
    end

    it "should be at the airport which the plane has just landed" do
      allow(airport).to receive(:park_plane)
      subject.land(airport)
      expect(airport).to have_received(:park_plane).with(subject)
    end

  end

  context "take off the plane" do

    it "should be able to respond to take_off method" do
      expect(subject).to respond_to :take_off
    end

    it "should take off from an airport" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "should be no longer in the airport when the plane has taken off" do
      allow(airport).to receive(:park_plane)
      subject.land(airport)
      allow(airport).to receive(:unpark_plane)
      taken_off_plane = subject.take_off(airport)
      expect(airport).to have_received(:unpark_plane).with(subject)
    end

  end

end
