require 'airport'
require 'plane'

describe Airport do
  describe '#initialize' do
    it 'sets hanger capacity' do
      subject = Airport.new(120) # clean uprubocop
      expect(subject.capacity).to eq 120
    end
  end

  describe '#hangar' do
    it { is_expected.to respond_to :hangar }

    it 'is expected to return an Array' do
      expect(subject.hangar).to be_kind_of(Array)
    end

    it 'is empty by deafult' do
      expect(subject.hangar).to be_empty
    end
  end

  describe '#approve_landing' do
    it { is_expected.to respond_to(:approve_landing).with(1).argument }

    it 'takes a plane as an argument and stroes it in the hangar' do
      plane = Plane.new
      plane.land(subject)
      expect(subject.hangar).to include(plane)
    end

    it 'raises an error when a plane tries to land while hangar is full' do
      subject.capacity.times do
        plane = Plane.new
        plane.land(subject)
      end
      # modify with name
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
      expect(subject.hangar).not_to include(plane)
    end
  end
end
