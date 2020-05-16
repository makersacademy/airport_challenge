require 'airport'
require 'plane'

describe Airport do
  describe '#capacity' do
    it { is_expected.to respond_to :capacity }

    it 'is expected to return an Integer' do
      expect(subject.capacity).to be_kind_of(Integer)
    end

    it 'has a default value of 20' do
      expect(subject.capacity).to eq 20
    end

    it 'can be overridden' do
      subject.capacity = 42
      expect(subject.capacity).to eq 42
    end
  end

  describe '#approve_landing' do
    it { is_expected.to respond_to(:approve_landing).with(1).argument }

    it 'takes a plane as an argument and stores it in the hangar' do
      plane = Plane.new
      plane.land(subject)
      expect(subject.in_hangar?(plane)).to be_truthy
    end

    it 'raises an error when a plane tries to land while hangar is full' do
      subject.capacity.times do
        plane = Plane.new
        plane.land(subject)
      end
      plane = Plane.new
      expect { plane.land(subject) }.to raise_error("Airport is at maximum capacity")
    end
  end

  describe '#approve_take_off' do
    it { is_expected.to respond_to(:approve_take_off).with(1).argument }

    it 'takes a plane as an argument and removes it from the hangar' do
      allow($stdout).to receive(:puts) # supress console output
      plane = Plane.new
      plane.land(subject)
      plane.take_off
      expect(subject.in_hangar?(plane)).not_to be_truthy
    end
  end

  context 'when weather is stormy' do
    
  end
end
