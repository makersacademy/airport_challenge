# frozen_string_literal: true

require 'airport.rb'

describe Airport do
  let(:plane) { :plane }
  subject(:airport) { described_class.new }

  describe '#initialize(capacity)' do
    it 'sets the default capacity of the airport to 5' do
      expect(airport.total_capacity).to eq(described_class::DEFAULT_CAPACITY)
    end
  end

  describe '#arrivals' do
    it 'stores planes in the airport hangar, and confirms storage' do
      airport.landing(plane)
      expect(airport.airport_hangar).to eq [plane]
    end

    it 'does not allow duplicate planes to arrive or depart' do
      airport.landing(plane)
      expect { airport.landing(plane) }.to raise_error('this plane has already arrived!')
      airport.taking_off(plane)
      expect { airport.taking_off(plane) }.to raise_error('this plane has already departed!')
    end
  end

  # # it 'does not allow planes to depart during bad weather' do
  # #   allow(airport.weather_forecast).to receive(:weather_forecast[0])
  # #   expect { airport.departures(plane) }.to raise_error('flights suspended due to bad weather!')
  # # end
end
