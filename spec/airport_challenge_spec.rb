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

  # context '#monitors arrivals and departures' do
  #   it 'allows planes to arrive' do
  #     expect(airport.arrivals(plane)).to eq "#{plane} has landed!"
  #   end
  #
  # #   it 'allows planes to depart' do
  # #     airport.departures(plane)
  # #     expect(airport.departures(plane)).to eq "#{plane} has taken off!"
  # #   end
  # # end
  # end

  describe '#arrivals and #departures' do
    it 'stores arrivals in the airport hangar' do
      airport.arrivals(plane)
      expect(airport.airport_hangar).to eq [plane]
    end

    # it 'arrival can be confirmed' do
    #   airport.departures(plane)
    #   expect(airport.airport_hangar).to include plane
    # end

    it 'allows planes to depart' do
      airport.departures(plane)
      expect(airport.departures(plane)).to eq "#{plane} has taken off!"
    end

    it 'departure can be confirmed' do
      airport.departures(plane)
      expect(airport.airport_hangar).not_to include plane
    end
  end

  describe '#weather changes' do
    context '#bad weather' do
      it '#prevents arrivals and departures if the weather is stormy' do
        allow(airport.weather).to receive(:stormy).and_return true
        airport.arrivals(plane)
        expect { airport.departures(plane) }.to raise_error("the weather is too bad!")
      end
    end
  end
end
