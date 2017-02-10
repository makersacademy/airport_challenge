require 'plane'

describe Plane do

  let(:airport) { double(:airport) }

  context "land the plane" do

    it "should land the plane at an airport" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "should be able to respond to landed? method" do
      expect(subject).to respond_to :landed?
    end

    it "should be able to land at an airport and confirm it's landed" do
      allow(airport).to receive(:park_plane)
      allow(subject).to receive (:weather) {1}
      subject.land(airport)
      expect(subject).to be_landed
    end

    it "should be at the airport which the plane has just landed" do
      allow(airport).to receive(:park_plane)
      allow(subject).to receive (:weather) {2}
      subject.land(airport)
      expect(airport).to have_received(:park_plane).with(subject)
    end

  end

  context "take off the plane" do

    it "should respond to take_off method with 1 agrument" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "should be able to respond to taken_off? method" do
      expect(subject).to respond_to :taken_off?
    end

    it "should return true when the plane is taken off" do
      allow(airport).to receive(:unpark_plane)
      allow(subject).to receive (:weather) {1}
      subject.take_off(airport)
      expect(subject.taken_off?).to eq true
    end

    it "should return false when the plane is not taken off" do
      allow(airport).to receive(:park_plane)
      allow(subject).to receive (:weather) {2}
      subject.land(airport)
      expect(subject.taken_off?).to eq false
    end

    it "should be no longer in the airport when the plane has taken off" do
      allow(airport).to receive(:unpark_plane)
      allow(subject).to receive (:weather) {1}
      taken_off_plane = subject.take_off(airport)
      expect(subject).not_to be_landed
      expect(airport).to have_received(:unpark_plane).with(subject)
    end

  end

  context "Weather is stormy" do

    # let(:plane) { Plane.new }
    #
    # it "should respond to weather method" do
    #   expect(subject).to respond_to :weather
    # end
    #
    # it "should return 0 if it's stormy" do
    #   allow(plane).to receive(:weather) {0}
    #   expect(plane.weather).to eq 0
    # end
    #
    # it "should NOT return 0 if it's NOT stormy" do
    #   allow(plane).to receive(:weather) {1}
    #   expect(plane.weather).not_to eq 0
    # end

    it "should respond to weather method" do
      expect(subject).to respond_to :stormy?
    end

  end

end
