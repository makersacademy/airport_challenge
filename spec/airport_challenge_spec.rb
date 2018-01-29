# frozen_string_literal: true

require 'airport.rb'

describe Airport do
  let(:plane) { :plane }
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:landing).with(1).argument }
  it { is_expected.to respond_to(:taking_off).with(1).argument }

  describe '#initialize' do
    it 'sets the default capacity of the airport to 5 planes' do
      expect(airport.capacity).to eq(described_class::DEFAULT_CAPACITY)
    end
  end

  context '#landing' do
    it 'planes are unable to land in stormy weather' do
      allow(airport).to receive(:weather) { 'stormy' }
      expect { airport.landing(plane) }.to raise_error 'the weather is too bad for landing!'
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

  context '#taking_off' do
    it 'planes are unable to take-off in stormy weather' do
      allow(airport).to receive(:weather) { 'stormy' }
      expect { airport.taking_off(plane) }.to raise_error 'the weather is too bad for taking-off!'
    end

    it 'allows all planes to take off if the weather is good' do
      expect(airport.taking_off(plane)).to eq "#{plane} has taken-off!"
    end

    it 'removes departed planes from the "airport hangar"' do
      airport.taking_off(plane)
      expect(airport.airport_hangar).not_to include plane
    end
  end
end
