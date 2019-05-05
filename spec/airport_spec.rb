require 'airport'
require 'plane'
require 'weather'

describe Airport do
  describe '#initialize' do
    it "creates an empty array for airport" do
      expect(subject).to be_empty
    end
    it 'initializes without arguments' do
      expect(Airport).to respond_to(:new).with(0).arguments
    end
  end


  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
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
      expect { subject.land Plane.new }.to raise_error "airport is full"
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
      expect { subject.take_off }.to raise_error "plane already taken off"
    end
    it "should be unable to take off if it is stormy" do
      subject.land Plane.new
      expect(Weather).to receive(:stormy?).and_return(true)
      expect(Weather).to receive(:random_num) { 5 }
      expect { subject.take_off }.to raise_error "cannot take off, it is stormy"
    end
  end
end
