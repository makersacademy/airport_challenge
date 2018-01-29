# frozen_string_literal: true

require 'airport.rb'

describe Airport do
  let(:plane) { Plane.new }
  subject(:airport) { described_class.new }

  describe '#initialize' do
    it 'sets the default capacity of the airport to 5 planes' do
      expect(airport.capacity).to eq(described_class::DEFAULT_CAPACITY)
    end
  end

  describe '#landing' do
    it 'planes are unable to land in stormy weather' do
      allow(airport).to receive(:weather) { 'stormy' }
      message = 'the weather is too bad for landing!'
      expect { airport.landing(plane) }.to raise_error message
    end

    it 'allows all planes to land if the weather is good' do
      expect(airport.landing(plane)).to eq "#{plane} has landed!"
    end

    it 'stores all planes that have landed in the "airport hangar"' do
      airport.landing(plane)
      expect(airport.airport_hangar).to eq [plane]
    end

    it 'raises an error if a single plane tries to land twice consecutively' do
      airport.landing(plane)
      expect { airport.landing(plane) }.to raise_error('this plane has already landed!')
    end
  end

  describe '#taking_off' do
    it 'planes are unable to take-off in stormy weather' do
      allow(airport).to receive(:weather) { 'stormy' }
      expect { airport.taking_off(plane) }.to raise_error 'the weather is too bad for taking-off!'
    end

    it 'allows all planes to take off if the weather is good' do
      expect(airport.taking_off(plane)).to eq "#{plane} has taken-off!"
    end

    it 'removes departed planes from the "airport hangar"' do
      airport.landing(plane) # before
      airport.taking_off(plane)
      expect(airport.airport_hangar).not_to include plane
    end
  end
end
