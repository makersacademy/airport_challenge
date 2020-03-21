require 'plane'

describe Plane do
  let(:full_airport) do 
    airport = Airport.new 

    10.times do
      plane = Plane.new
      plane.land(airport)
    end

    airport
  end

  let(:empty_airport) { Airport.new }

  let(:landed_plane) do
    plane = Plane.new
    plane.land(empty_airport)
    plane
  end

  let(:airborne_plane) { Plane.new }

  let (:stormy_weather) { double(:weather, :current_weather => Weather::STORMY )}
  let (:clear_weather) { double(:weather, :current_weather => Weather::CLEAR )}

  context 'landing' do
    it 'can be instructed to land at an airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'will not land if the airport is full' do
      expect { airborne_plane.land(full_airport) }.to raise_error 'Unable to land, airport is full'
    end

    it 'will land if there is space at the airport' do
      expect { airborne_plane.land(empty_airport) }.not_to raise_error
    end

    it 'will not land if it has already landed' do
      expect { landed_plane.land(empty_airport) }.to raise_error 'Unable to land, plane has already landed'
    end
  end

  context 'taking off' do
    it 'can be instructed to take off from an airport' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'confirms it is no longer in the airport after it has taken off' do
      expect(landed_plane.take_off(clear_weather.current_weather)).to eq "No longer in the airport"
    end

    it 'will not take off if it is has not landed' do
      expect { airborne_plane.take_off(clear_weather.current_weather) }.to raise_error 'Unable to take off, plane is not landed'
    end

    it 'will not take off if the weather is stormy' do
      expect { landed_plane.take_off(stormy_weather.current_weather) }.to raise_error 'Unable to take off, stormy weather'
    end
  end
end
