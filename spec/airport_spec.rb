require 'airport'

describe Airport do

  describe 'initialize' do
    it 'defaults to 100 planes if no capacity is given' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'takes a number as the airport capacity' do
      airport = Airport.new(250)
      expect(airport.capacity).to eq 250
    end
  end

  describe '#land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'raises an error if hangar is full' do
      100.times{subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error("Hangar is full")
    end
  end
end