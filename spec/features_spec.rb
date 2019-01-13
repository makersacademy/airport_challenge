require 'airport'
require 'plane'
require 'Weather'

RSpec.describe 'Feature Tests' do
  describe Airport do
    it 'instructs a plane to land' do
      plane = Plane.new
      allow(Weather).to receive(:current).and_return('clear')
      expect { subject.land(plane) }.to_not raise_error
    end
  
    it 'instructs a plane to take off and confirm' do
      plane = Plane.new
      allow(Weather).to receive(:current).and_return('clear')
      subject.land(plane)
      allow(Weather).to receive(:current).and_return('clear')
      subject.take_off(plane)
      expect(subject.plane).to_not eq plane
    end
  
    it 'prevents take off when weather is stormy' do
      plane = Plane.new
      allow(Weather).to receive(:current).and_return('clear')
      subject.land(plane)
      allow(Weather).to receive(:current).and_return('stormy')
      message = 'Cannot Take Off: Turbulent Weather'
      expect { subject.take_off(plane) }.to raise_error(message)
    end

    it 'prevents landing when weather is stormy' do
      plane = Plane.new
      allow(Weather).to receive(:current).and_return('stormy')
      message = 'Cannot Land: Turbulent Weather'
      expect { subject.land(plane) }.to raise_error(message)
    end

    it 'prevents landing when the airport is full' do
      plane = Plane.new
      allow(Weather).to receive(:current).and_return('clear')
      subject.land(plane)
      message = 'Cannot Land: Airport Full' 
      expect { subject.land(plane) }.to raise_error(message)
    end

    it 'can change capacity' do
      subject.capacity = 5
      expect(subject.capacity).to eq 5
    end
  end

  describe Weather do
    it 'instructs to receive current weather' do
      expect { Weather.current }.to_not raise_error
    end
  
    it 'returns either stormy or clear' do
      expect(Weather.current).to eq("stormy").or eq("clear")
    end
  end
end
