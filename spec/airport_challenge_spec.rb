# frozen_string_literal: true

require 'airport.rb'

# I want to instruct a plane to land at an airport [Y]
# I want to instruct a plane to take off from an airport [Y]
# and confirm that it is no longer in the airport [?]

describe Airport do
  let(:plane) { :plane }
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:landing).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  context '#take-off and land plane' do
    it 'allows planes to land' do
      expect(airport.landing(plane)).to eq "#{plane} has landed!"
    end

    it 'allows planes to take off' do
      airport.landing(plane)
      expect(airport.take_off(plane)).to eq "#{plane} has taken off!"
    end
  end

  context '#stores and removes planes in the airport hangar' do
    it 'stores arrivals in airport hangar' do
      airport.landing(plane)
      expect(airport.airport_hangar).to include plane
    end

    it 'removes arrivals from airport hangar' do
      airport.take_off(plane)
      expect(airport.airport_hangar).not_to include plane
    end
  end
end
