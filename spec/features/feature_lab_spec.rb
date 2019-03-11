# Feature lab
require 'airport'
require 'plane'

describe "Features lab:" do
  let(:airport) { Airport.new(weather_reporter, 20) }
  let(:plane) { Plane.new }
  let(:weather_reporter) { WeatherReporter.new }

  context "When not stormy: " do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return false
    end
    it 'Plane lands' do
      expect { airport.land(plane) }.not_to raise_error
    end

    it 'Plane leaves' do
      airport.land(plane)
      expect { airport.take_off(plane) }.not_to raise_error
    end

    it 'Has a default capacity' do
      default_airport = Airport.new(weather_reporter)
      Airport::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error 'Cannot land plane; Airport full'
    end

    it 'Error check; Flying planes cannot take off' do
      airport.land(plane)
      flying_plane = airport.take_off(plane)
      expect { flying_plane.take_off }.to raise_error 'Plane cannot take off; Plane flying already!'
    end

    it 'Error check; Flying planes cannot be in an airport' do
      airport.land(plane)
      flying_plane = airport.take_off(plane)
      expect { flying_plane.airport}.to raise_error 'Plane cannot be at airport; Plane flying already!'
    end

    it 'Plane leaves current airport' do
      airport_2 = Airport.new(weather_reporter, 20)
      airport_2.land(plane)
      expect { airport.take_off(plane) }.to raise_error "Plane can't take off; Not at airport."
    end

    context 'When full' do
      it 'No activity' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane; Airport full'
      end
    end
  end

  context "When stormy" do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return true
    end
    it 'No landing' do
      expect { airport.land(plane) }.to raise_error 'Cannot land plane; Weather is stormy!'
    end
    it 'No taking off' do
      expect { airport.take_off(plane) }.to raise_error 'Plane cannot take off; Weather is stormy!'
    end
  end
end
