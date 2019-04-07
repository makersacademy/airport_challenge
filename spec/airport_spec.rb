require 'airport'
require 'plane'
require 'weather'

def clear_conditions
  allow(subject.instance_of_weather).to receive(:storm?).and_return false
end

def stormy_conditions
  allow(subject.instance_of_weather).to receive(:storm?).and_return true
end

describe Airport do

  it 'should respond to #land' do
    expect(subject).to respond_to :land
  end

  describe '#land' do
    it 'should land a plane' do
      plane = Plane.new
      clear_conditions
      expect(subject.land(plane)).to eq [plane]
    end

    it 'raises an error if there is a storm' do
      plane = Plane.new
      stormy_conditions
      expect { subject.land(plane) }.to raise_error 'cant land in storm'
    end

    it 'raises an error when airport is full' do
      plane = Plane.new
      allow(subject).to receive(:full?).and_return true
      clear_conditions
      expect { subject.land(plane) }.to raise_error 'hangar full'
    end
  end

  describe '#take_off' do
    it 'should allow a plane to take_off' do
      plane = Plane.new
      clear_conditions
      subject.land(plane)
      clear_conditions
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when there are no planes in airport' do
      expect { subject.take_off }.to raise_error 'no planes available'
    end

    it 'raises an error if storm? is true' do
      plane = Plane.new
      clear_conditions
      subject.land(plane)
      stormy_conditions
      expect { subject.take_off }.to raise_error 'cant fly in storm!'
    end
  end

  describe '#initialize' do
    it 'has a variable capacity' do
      airport = Airport.new(50)
      50.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error 'hangar full'
    end

    it 'defaults capacity' do
      airport = Airport.new
      Airport::DEFAULT_CAPACITY.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error 'default hangar capacity full'
    end
  end
end
