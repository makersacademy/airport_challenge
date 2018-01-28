# frozen_string_literal: true

require 'airport.rb'

# I want to instruct a plane to land at an airport [Y]
# I want to instruct a plane to take off from an airport [Y]
# and confirm that it is no longer in the airport [Y]

describe Airport do
  let(:plane) { :plane }
  subject(:airport) { described_class.new }
  subject(:larger_airport) { described_class.new 50 }

  describe '#initialize(capacity)' do
    it 'sets the default capacity of the airport to 5' do
      expect(airport.total_capacity).to eq(described_class::DEFAULT_CAPACITY)
    end

    it 'can have a greater capacity if needed' do
      expect(larger_airport.total_capacity).to eq 50
    end
  end

  describe '#arrivals' do
    it 'stores planes in the airport hangar, and confirms storage' do
      airport.arrivals(plane)
      expect(airport.airport_hangar).to eq [plane]
    end

    it 'does not allow duplicate planes to arrive or depart' do
      airport.arrivals(plane)
      expect { airport.arrivals(plane) }.to raise_error('this plane has already arrived!')
      airport.departures(plane)
      expect { airport.departures(plane) }.to raise_error('this plane has already departed!')
    end
  end

  # # it 'does not allow planes to depart during bad weather' do
  # #   allow(airport.weather_forecast).to receive(:weather_forecast[0])
  # #   expect { airport.departures(plane) }.to raise_error('flights suspended due to bad weather!')
  # # end
end
