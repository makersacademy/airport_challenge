require 'airport'
require 'plane'
require 'weather'

describe Airport do
  describe '#hanger_full?' do
    context 'hanger is full' do
      it 'returns true' do
        airport = Airport.new(0)
        expect(airport.hanger_full?).to be true
      end
    end

    context 'hanger is not full' do
      it 'returns false' do
        expect(subject.hanger_full?).to be false
      end
    end
  end

  describe '#land' do
    context 'plane is airbourne, hanger is not full, weather is okay' do
      it 'lands the plane in the airport' do
        airport = Airport.new
        plane = Plane.new
        weather = Weather.new
        allow(weather).to receive(:generate_weather) { 5 }

        airport.land(plane, weather.generate_weather)
        expect(airport.in_hanger?(plane)).to be true
      end
    end
  end

  describe '#take_off' do
    context 'plane is in airport, weather is okay' do
      it 'triggers a plane to take off from the airport' do
        airport = Airport.new
        plane = Plane.new
        weather = Weather.new
        allow(weather).to receive(:generate_weather) { 5 }
  
        airport.land(plane, weather.generate_weather)
        airport.take_off(plane, weather.generate_weather)
        expect(airport.in_hanger?(plane)).to be false
      end
    end
  end
end
