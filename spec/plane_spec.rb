require 'plane'

describe Plane do
  let(:set_weather_to_clear) { allow(Weather).to receive(:now).and_return(Weather::CLEAR) }
  let(:set_weather_to_stormy) { allow(Weather).to receive(:now).and_return(Weather::STORMY) }

  let(:full_airport) { double(:airport, :full? => true) }
  let(:empty_airport) { double(:airport_empty, :full? => false, :notify_that_plane_has_landed => true, :notify_that_plane_has_taken_off => true) }

  context 'landing' do
    it 'can be instructed to land at an airport' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'will not land if the airport is full' do
      set_weather_to_clear
      expect { subject.land(full_airport) }.to raise_error 'Unable to land, airport is full'
    end

    it 'will land if there is space at the airport' do
      set_weather_to_clear
      expect { subject.land(empty_airport) }.not_to raise_error
    end

    it 'will not land if it has already landed' do
      set_weather_to_clear
      subject.land(empty_airport)
      expect { subject.land(empty_airport) }.to raise_error 'Unable to land, plane has already landed'
    end

    it 'will not land if the weather is stormy' do
      set_weather_to_stormy
      expect { subject.land(empty_airport) }.to raise_error 'Unable to land, stormy weather'
    end
  end

  context 'taking off' do
    it 'can be instructed to take off from an airport' do
      expect(subject).to respond_to(:take_off)
    end

    it 'confirms it is no longer in the airport after it has taken off' do
      set_weather_to_clear
      subject.land(empty_airport)
      expect(subject.take_off).to eq 'No longer in the airport'
    end

    it 'will not take off if it is has not landed' do
      set_weather_to_clear
      expect { subject.take_off }.to raise_error 'Unable to take off, plane is not landed'
    end

    it 'will not take off if the weather is stormy' do
      set_weather_to_clear
      subject.land(empty_airport)
      set_weather_to_stormy
      expect { subject.take_off }.to raise_error 'Unable to take off, stormy weather'
    end
  end
end
