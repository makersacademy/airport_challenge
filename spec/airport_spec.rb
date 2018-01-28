require 'airport'
require 'plane'
require 'weather'

describe Airport do 
  let (:plane) { Plane.new }
  let (:weather) { double weather, stormy?: false}

  describe '#land' do 
    it 'allows planes to land' do 
      expect(subject.land(plane)).to include(plane)
    end

    it 'raises an error when airport is full' do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'hangar full'
    end

  end

  describe '#take_off' do 
    it 'allows planes to take off' do 
      subject.land(plane)
      expect(subject.take_off(plane)).not_to include(plane)
    end

    it 'raises an error when airport is empty' do 
      expect { subject.take_off(plane) }.to raise_error 'hangar empty'
    end

    it 'raises an error when plane is already in hangar' do 
      subject.land(plane)
      expect(subject.land(plane)).to raise_error 'plane already in hangar'
    end
  end

  describe '#initialize' do 
    it 'allows to edit initialized capacity' do 
      expect(subject.capacity = 20).to eq 20
    end
  end

  context 'stormy weather' do 
    describe '#land' do
      it 'raises an error when airport is stormy' do 
        weather = Weather.new
        allow(weather).to receive(:stormy?) { true }
        expect { subject.land(plane) }.to raise_error 'cannot land due to stormy weather'
      end
    end
  end
end
