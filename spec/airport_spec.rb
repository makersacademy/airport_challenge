require './lib/airport.rb'
require_relative '../lib/plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }
  let(:aircraft) { double(:aircraft) }

  describe "#accept_aircraft" do
    it "Expects an airport to accept a landing aircraft" do
      expect(airport).to respond_to(:accept_aircraft).with(1).argument
    end

    it "Has a attribute set to an instance of Plane post landing" do
      expect(airport.accept_aircraft(plane)).to eq airport.aircraft
    end

    it "Accepts many aircraft" do
      10.times { airport.accept_aircraft(plane) }
      expect(airport.aircraft.count).to eq 10
    end

    it "Raises an error if too many aircraft land" do
      Airport::DEFAULT_CAPACITY.times { airport.accept_aircraft(plane) }
      expect { airport.accept_aircraft(plane) }.to raise_error "Cannot land: airport full."
    end
  end

  describe "#capacity" do
    it { is_expected.to respond_to :capacity }
    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe "#release_aircraft" do
    it { is_expected.to respond_to :release_aircraft }

    it "Raises exception if attempts to release aircraft when there are none" do
      expect { airport.release_aircraft(plane) }.to raise_error "Error: There are no planes to release."
    end

    it "Releases a specific aircraft" do
      airport.accept_aircraft(plane)
      expect(airport.release_aircraft(plane)).to eq plane
    end

    it "Raises exception when trying to release a plane not in the airport" do
      airport.accept_aircraft(plane)
      expect { airport.release_aircraft('not_a_plane') }.to raise_error "ERROR: Not valid plane."
    end
  end
      # context "#stormy weather" do
        # it "Raises exception if weather is stormy on take off" do
        #  allow(:weather).to receive(:stormy).and_return(true)
        #  airport.accept_aircraft(plane)
        #  weather.stormy
        #  expect { airport.release_aircraft(plane) }.to raise_error "NO TAKE-OFFS IN STORMS."
      #  end
end
