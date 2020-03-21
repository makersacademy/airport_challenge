require 'plane'

describe Plane do

  let(:clear_weather) { double(:clear_weather, :current_weather => Weather::CLEAR) }

  let(:stormy_weather) { double(:clear_weather, :current_weather => Weather::STORMY) }

  let(:full_airport) { double(:airport, :full? => true) }

  let(:empty_airport) { double(:airport_empty, :full? => false, :notify_that_plane_has_landed => true, :notify_that_plane_has_left => true) }

  let(:landed_plane) do
    plane = Plane.new
    plane.land(empty_airport, clear_weather)
    plane
  end

  let(:airborne_plane) { Plane.new }

  context 'landing' do
    it 'can be instructed to land at an airport' do
      expect(subject).to respond_to(:land).with(2).argument
    end

    it 'will not land if the airport is full' do
      expect { airborne_plane.land(full_airport, clear_weather) }.to raise_error 'Unable to land, airport is full'
    end

    it 'will land if there is space at the airport' do
      expect { airborne_plane.land(empty_airport, clear_weather) }.not_to raise_error
    end

    it 'will not land if it has already landed' do
      expect { landed_plane.land(empty_airport, clear_weather) }.to raise_error 'Unable to land, plane has already landed'
    end

    it 'will not land if the weather is stormy' do
      expect { airborne_plane.land(empty_airport, stormy_weather) }.to raise_error 'Unable to land, stormy weather'
    end
  end

  context 'taking off' do
    it 'can be instructed to take off from an airport' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'confirms it is no longer in the airport after it has taken off' do
      expect(landed_plane.take_off(clear_weather)).to eq 'No longer in the airport'
    end

    it 'will not take off if it is has not landed' do
      expect { airborne_plane.take_off(clear_weather) }.to raise_error 'Unable to take off, plane is not landed'
    end

    it 'will not take off if the weather is stormy' do
      expect { landed_plane.take_off(stormy_weather) }.to raise_error 'Unable to take off, stormy weather'
    end
  end
end
