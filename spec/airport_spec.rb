require './docs/airport.rb'

describe Airport do

  describe '#land_plane' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'takes off' do
      plane = Plane.new
      expect(subject.takeoff(plane)).to eq [plane]
    end
  end

  describe 'full' do
    it 'raises error if airport is full' do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport full'
    end
  end

  describe 'empty' do
    it 'raises error if airport is empty' do
      subject.capacity.times { subject.takeoff Plane.new }
      expect { subject.takeoff Plane.new }.to raise_error 'Airport full'
    end
  end
end
