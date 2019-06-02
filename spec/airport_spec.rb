require 'airport'
require 'plane'

describe Airport do

  describe '#land(plane)' do
    # it { is_expected.to respond_to(:land).with(1).argument }
    it 'plane lands at the airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error when the airport is full' do
      subject.land(Plane.new)
      expect { subject.land Plane.new }.to raise_error 'Airport full'
    end
  end

  describe '#take_off' do
    # it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'plane takes off from airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    # it { is_expected.to respond_to(:plane) }
    it 'plane is no longer at the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off
      expect(subject.plane).to eq plane
    end

    it 'raises an error when the airport is empty' do
      expect { subject.take_off }.to raise_error 'Airport empty'
    end
  end
end
