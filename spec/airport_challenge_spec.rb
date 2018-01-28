# frozen_string_literal: true

require 'airport.rb'

describe Airport do
  let(:plane) { :plane }
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:landing).with(1).argument }
  it { is_expected.to respond_to(:taking_off).with(1).argument }

  describe '#initialize' do
    it 'sets the default capacity of the airport to 5' do
      expect(airport.capacity).to eq(described_class::DEFAULT_CAPACITY)
    end
  end

  context '#arrivals' do
    it 'allows planes to arrive' do
      expect(airport.landing(plane)).to eq "#{plane} has landed!"
    end

    it 'stores landed planes in the airport hangar' do
      airport.landing(plane)
      expect(airport.airport_hangar).to eq [plane]
    end

    it 'raises an error for duplicated arrivals and departures' do
      airport.landing(plane)
      expect { airport.landing(plane) }.to raise_error('this plane has already landed!')
      airport.taking_off(plane)
      expect { airport.taking_off(plane) }.to raise_error('this plane has already taken-off!')
    end
  end

  # # it 'does not allow planes to depart during bad weather' do
  # #   allow(airport.weather_forecast).to receive(:weather_forecast[0])
  # #   expect { airport.departures(plane) }.to raise_error('flights suspended due to bad weather!')
  # # end
end
