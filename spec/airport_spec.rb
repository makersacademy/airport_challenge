require 'airport'

describe 'Airport' do
  airport = Airport.new
  plane = "BA"
 
  
  describe '#default_capacity' do
    it 'sets default capacity' do
      expect(airport.capacity).to eq 20
    end
  end

  describe '#land' do
    it 'plane lands at the airport' do
      allow(airport).to receive(:weather_check) { "sunny" }
      expect(airport.land(plane)).to eq [plane]
    end

    it 'plane doesnt land at the airport when its stormy' do
      allow(airport).to receive(:weather_check) { "stormy" }
      expect(airport.land(plane)).to eq "Can't land because of weather"
    end
  end

  describe '#take_off' do
    it 'if plane takes off from the airport during stormy weather' do
      allow(airport).to receive(:weather_check) { "stormy" }
      expect(airport.take_off(plane)).to eq "Can't take off because of weather"
    end
  
    it 'check if a plane stayed during stormy weather' do
      allow(airport).to receive(:weather_check) { "stormy" }
      expect(airport.list_planes).to eq [plane]
    end

    it 'plane takes off from the airport when its sunny' do
      allow(airport).to receive(:weather_check) { "sunny" }
      airport.take_off(plane)
      expect(airport.list_planes).to eq []
    end
  end

  describe '#full' do
    it 'checks if airport is full' do
      expect(airport.full?).to eq false
    end
  end
end
