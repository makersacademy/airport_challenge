require 'airport'
require 'plane'

describe Airport do
  plane = Plane.new

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}
    it 'allows a plane to land' do
      expect(subject.land(plane).pop).to be_instance_of(Plane)
      expect(subject.land(plane)).to eq [plane]
    end
    it 'raises an error when the airport is full' do
      (Airport::DEFAULT_CAPACITY).times { subject.land(plane) }
      expect{subject.land(plane)}.to raise_error(RuntimeError)
    end
    it 'does not land the same plane twice' do

    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off)}
    it 'allows a plane to take off' do
      subject.land(plane)
      expect(subject.take_off).to be_instance_of(Plane)
    end
    it 'removes a plane from the airport after take off' do
      subject.land(plane)
      subject.take_off
      expect(subject.land(Plane.new)).not_to include(plane)
    end
    it 'raises an error when there are no planes' do
      expect{subject.take_off}.to raise_error(RuntimeError)
    end
  end

  describe '#initialize' do
    it 'sets a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'allows defauly capacity to be overridden' do
      airport = Airport.new(100)
      expect(airport.capacity).to eq 100
    end
  end
end
