require 'airport'
require 'weather'

describe Airport do

  let(:plane) { Plane.new }
  let(:weather) { double(:Weather, :stormy? => false) }

  describe '.land' do
    context 'given a plane' do
      it 'lands the plane at an airport' do
        expect(subject.land(plane, weather)).to contain_exactly plane
      end
    end

    context 'when landing a plane' do
      it 'returns error if airport is full' do
        10.times { subject.land(plane, weather) } 
        expect { subject.land(plane, weather) }.to raise_error 'Airport is full.'
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
        subject.takeoff(plane, weather)
        subject.land(plane, weather)
        expect(subject.at_airport?(plane, subject)).to eq true
      end
    end

    context 'during stormy weather' do
      it 'raises error if plane lands' do
        weather = double(:stormy? => true)
        expect { subject.land(plane, weather) }.to raise_error 'Safety: unable to land due to storm.'
      end
    end
  end

  describe '.takeoff' do
    context 'plane takes off' do
      it 'removes a plane from the list of planes at airport' do
        subject.land(plane, weather)
        expect(subject.takeoff(plane, weather)).to eq plane
      end

      it 'adds plane to list of flying planes' do
        
      end
    end
    context 'during stormy weather' do
      it 'raises error if plane takes off' do
        subject.land(plane, weather)
        weather = double(:stormy? => true)
        expect { subject.takeoff(plane, weather) }.to raise_error 'Safety: unable to takeoff due to storm.'
      end
    end
  end

  describe '.at_airport?' do
    context 'given a plane' do
      it 'returns false if no longer at airport' do
        subject.land(plane, weather)
        subject.takeoff(plane, weather)
        expect(subject.at_airport?(plane, subject)).to eq false
      end

      it 'returns true if at airport' do
        subject.land(plane, weather)
        expect(subject.at_airport?(plane, subject)).to eq true
      end
    end
  end
end
