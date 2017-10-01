require 'plane'
require 'airport'

describe 'FEATURE TEST: user stories' do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  context 'when weather is good' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
    before do
        allow(airport).to receive(:stormy?).and_return(false)
    end

    it 'so planes land at airports, instruct a plane to land' do

      expect { airport.instruct_plane_to_land(plane) }.not_to raise_error
    end

    it 'instructs a plane to land and holds it in the planes array' do

      expect { airport.instruct_plane_to_land(plane) }.to change { airport.plane_count }.by(1)
    end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'so planes take off from airports, instruct a plane to take off' do

      expect { airport.instruct_plane_to_take_off(plane) }.not_to raise_error
    end

    it 'confirms that a plane is no longer in the airport' do

      airport.planes << plane
      expect { airport.instruct_plane_to_take_off(plane) }.to change { airport.plane_count }.by(-1)
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    it 'prevents landing when the airport is full' do
      allow(airport).to receive(:stormy?).and_return(false)
      5.times do
        airport.instruct_plane_to_land(Plane.new)
      end
      expect { airport.instruct_plane_to_land(plane)}.to raise_error("plane cannot land because the airport is full")
    end

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate
    it 'has a default capacity which can be overridden as appropriate' do
      airport.capacity = 10
      expect(airport.capacity).to eq(10)
    end

  end

  context 'when weather is bad' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
    before do
      allow(airport).to receive(:stormy?).and_return(true)
    end
      # As an air traffic controller
      # To ensure safety
      # I want to prevent takeoff when weather is stormy
    it 'prevents take_off when weather is stormy' do
      expect { airport.instruct_plane_to_take_off(plane) }.to raise_error("plane cannot take off in stormy weather")
    end

      # As an air traffic controller
      # To ensure safety
      # I want to prevent landing when the weather is stormy
    it 'prevents landing when the weather is stormy' do
      expect { airport.instruct_plane_to_land(plane) }.to raise_error("plane cannot land in stormy weather")
    end
  end


end
