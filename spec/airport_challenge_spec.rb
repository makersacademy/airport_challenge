# frozen_string_literal: true

require 'airport.rb'

# I want to instruct a plane to land at an airport [Y]
# I want to instruct a plane to take off from an airport [Y]
# and confirm that it is no longer in the airport [?]

describe Airport do
  let(:plane) { :plane }
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:arrivals).with(1).argument }
  it { is_expected.to respond_to(:departures).with(1).argument }

  context '#monitors arrivals and departures' do
    it 'allows planes to arrive' do
      expect(airport.arrivals(plane)).to eq "#{plane} has landed!"
    end

    it 'allows planes to depart' do
      airport.departures(plane)
      expect(airport.departures(plane)).to eq "#{plane} has taken off!"
    end
  end

  context '#stores and removes planes in the airport hangar' do
    it 'stores arrivals in airport hangar' do
      airport.arrivals(plane)
      expect(airport.airport_hangar).to include plane
    end

    it 'removes departures from airport hangar' do
      airport.departures(plane)
      expect(airport.airport_hangar).not_to include plane
    end
  end
end
