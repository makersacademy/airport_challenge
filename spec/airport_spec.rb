require 'airport'
require 'weather'

describe Airport do
  describe '.land' do
    context 'given a plane' do
      it 'lands the plane at an airport' do
        plane = Plane.new
        weather = double(:Weather, :stormy? => false)
        expect(subject.land(plane, weather)).to contain_exactly plane
      end
    end

    context 'when landing a plane' do
      it 'returns error if airport is full' do
        weather = double(:Weather, :stormy? => false)
        10.times {subject.land(Plane.new, weather)} 
        expect {subject.land(Plane.new, weather)}.to raise_error 'Airport is full.'
      end
    end

    context 'airport capacity set to default' do
      it 'can be overwridden for different airports as appropriate' do
        Airport.new capacity = 20
        expect(capacity).to eq 20
      end
    end

    context 'during sunny weather' do
      it 'can land the plane' do
        plane = Plane.new
        weather = double(:Weather, :stormy? => false)
        subject.takeoff(plane, weather)
        subject.land(plane, weather)
        expect(subject.at_airport? plane).to eq true
      end
    end

    context 'during stormy weather' do
      it 'raises error if plane lands' do
        plane = Plane.new
        weather = double(:Weather, :stormy? => true)
        expect {subject.land(plane, weather)}.to raise_error 'Safety: unable to land due to storm.'
      end
    end
  end

  describe '.takeoff' do
    context 'plane takes off' do
      it 'removes a plane from the list of planes at airport' do
        plane = Plane.new
        weather = double(:Weather, :stormy? => false)
        subject.land(plane, weather)
        expect(subject.takeoff(plane, weather)).to eq plane
      end
    end
    context 'during stormy weather' do
      it 'raises error if plane takes off' do
        plane = Plane.new
        weather = double(:Weather, :stormy? => false)
        subject.land(plane, weather)
        weather = double(:Weather, :stormy? => true)
        expect {subject.takeoff(plane, weather)}.to raise_error 'Safety: unable to takeoff due to storm.'
      end
    end
  end

  describe '.at_airport?' do
    context 'given a plane' do
      it 'returns false if not in @planes array' do
        plane = Plane.new
        weather = double(:Weather, :stormy? => false)
        subject.land(plane, weather)
        subject.takeoff(plane, weather)
        expect(subject.at_airport? plane).to eq false
      end

      it 'returns true if in @planes array' do
        plane = Plane.new
        weather = double(:Weather, :stormy? => false)
        subject.land(plane, weather)
        expect(subject.at_airport? plane).to eq true
      end
    end
  end
end
