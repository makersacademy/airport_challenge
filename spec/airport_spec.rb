require 'airport'
require 'plane'
require 'weather'

describe Airport do
  describe '#land' do
    it "should respond to land" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      expect(subject).to respond_to(:land)
    end
    it "should return a plane" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
    it "raises an error when airport is full" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      3.times { subject.land(Plane.new) }
      expect{ subject.land Plane.new }.to raise_error "airport is full"
    end
  end

  describe '#take_off' do
    it "should respond to take off" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      expect(subject).to respond_to(:take_off)
    end
    it "should allow a plane to take off" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq(plane)
    end
    it "should raise an error if plane has already taken off" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      expect{ subject.take_off }.to raise_error "plane already taken off"
    end
    it "should be unable to take off if it is stormy" do
      allow(Weather).to receive(:stormy?) { true }
      subject.land Plane.new
      expect{ subject.take_off }.to raise_error "cannot take off, it is stormy"
    end
  end
end
