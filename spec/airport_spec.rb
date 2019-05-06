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
    it 'initializes with an argument' do
      expect(Airport).to respond_to(:new).with(1).argument
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "should return a plane" do
      allow(subject.weather).to receive(:stormy?) { false }
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
    it "raises an error when airport is full" do
      allow(subject.weather).to receive(:stormy?) { false }
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land Plane.new }.to raise_error "airport is full"
    end
    it "can land planes up to airports default capacity" do
      allow(subject.weather).to receive(:stormy?) { false }
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect(subject.planes.size).to eq(Airport::DEFAULT_CAPACITY)
    end
    it "raises an error when trying to land a plane that has already landed" do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "plane already at airport"
    end
    it 'can land a plane if weather is not stormy' do
      allow(subject.weather).to receive(:stormy?) { false }
      @planes = []
      plane = Plane.new
      subject.land(plane)
      @planes << plane
      expect(@planes).to include(plane)
      expect(@planes.size).to eq(1)
    end
    it 'will raise an error if plane tries to land in stormy weather' do
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.land Plane.new }.to raise_error "cannot land in stormy weather"
    end
  end

  describe '#take_off' do
    it "should respond to take off" do
      allow(subject.weather).to receive(:stormy?) { false }
      expect(subject).to respond_to(:take_off)
    end
    it "should allow a plane to take off" do
      allow(subject.weather).to receive(:stormy?) { false }
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq(plane)
    end
    it "should raise an error if plane has already taken off" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      expect { subject.take_off }.to raise_error "plane already taken off"
    end
    it 'raises an error when a plane tries to take off in stormy weather' do
      subject.land(Plane.new)
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.take_off }.to raise_error("cannot take off, it is stormy")
    end
  end

  describe '#landed' do
    it { is_expected.to respond_to(:landed?).with(1).argument }
  end
end
