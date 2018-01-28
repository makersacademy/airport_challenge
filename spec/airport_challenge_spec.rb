# frozen_string_literal: true

require 'airport.rb'

# I want to instruct a plane to land at an airport [Y]
# I want to instruct a plane to take off from an airport [Y]
# and confirm that it is no longer in the airport [Y]

describe Airport do
  let(:plane) { :plane }
  subject(:airport) { described_class.new }

  # it { is_expected.to respond_to(:arrivals).with(1).argument }
  # it { is_expected.to respond_to(:departures).with(1).argument }

  context '#arrivals' do
    it 'allows planes to arrive' do
      airport.arrivals(plane)
      expect(airport.arrivals(plane)).to eq "#{plane} has arrived!"
    end

    it 'allows arrivals to be confirmed' do
      airport.arrivals(plane)
      expect(airport.airport_hangar).to include plane
    end

    it 'stores arrivals in the airport hangar' do
      airport.arrivals(plane)
      expect(airport.airport_hangar).to eq [plane]
    end
  end

  context '#departures' do
    it 'allows planes to depart' do
      airport.departures(plane)
      expect(airport.departures(plane)).to eq "#{plane} has departed!"
    end

    it 'allows departures to be confirmed' do
      airport.departures(plane)
      expect(airport.airport_hangar).not_to include plane
    end
  end

  context '#bad_weather' do
    it 'prevents departures if the weather is stormy' do
    end
  end
  #     allow(airport.weather).to receive(:storm_forecast).and_return true
  #     airport.departures(plane)
  #     expect { airport.departures(plane) }.to raise_error('the weather is too bad!')
  #   end
  # end
end
