require 'airport'
require 'weather'

describe Airport do

  describe '#initialization' do
    it 'initializes with a capacity given by the argument' do
      airport = Airport.new(30)
      expect(airport.capacity).to eq 30
    end
    it 'initializes with a default capacity when no argument given' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
  context 'good weather' do
    before do
      allow(subject.weather).to receive(:stormy?).and_return(false)
    end
    describe '#land' do
      it 'raises an error if the airport is full' do
        expect { 3.times { subject.land(Plane.new) } }.to raise_error 'airport full'
      end
      it 'raises an error if the plane is grounded' do
        plane = Plane.new
        expect { 2.times { subject.land(plane) } }.to raise_error 'plane already grounded'
      end
    end
    describe '#take_off' do
      it 'raises an error if a plane is already flying' do
        expect { subject.take_off(Plane.new) }.to raise_error 'plane already airbourne'
      end
      it 'raises an error if plane is not in the airport' do
        airport2 = Airport.new
        allow(airport2.weather).to receive(:stormy?).and_return(false)
        plane = Plane.new
        subject.land(plane)
        expect { airport2.take_off(plane) }.to raise_error 'plane not in this airport!'
      end
      it 'confirms plane no longer in airport' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.take_off(plane)).to eq "#{plane} has departed"
      end
    end
  end
end
