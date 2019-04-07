require 'airport'
require 'plane'

describe 'User stories' do

  let(:airport) { Airport.new(50, weather_report) }
  let(:plane) { Plane.new }
  let(:weather_report) { WeatherReport.new }
  context 'when not stormy' do
    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport
    before do
      allow(weather_report).to receive(:stormy?).and_return false
    end

    it 'instruct a plane to land at an airport' do
      expect { airport.land_plane(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport
    it 'instructs a plane to take off from an airport' do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    # and confirm that it is no longer in the airport

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    context 'when airport is full' do
      it "forbids planes from landing" do
        50.times do
          airport.land_plane(plane)
        end
        expect { airport.land_plane(plane) }.to raise_error "Airport is full"
      end
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
  context 'when weather is stormy' do
    before do
      allow(weather_report).to receive(:stormy?).and_return true
    end

    it "prevents planes from landing" do
      expect { airport.land_plane(plane) }.to raise_error "Cannot land: weather is stormy"
    end

    it "prevents planes from taking off" do
      expect { airport.take_off(plane) }.to raise_error "Cannot take off: weather is stormy"
    end
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

end
