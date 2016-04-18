require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  before(:each) { allow(airport).to receive(:bad_weather?) { false } }
  describe '#initialize' do
    it 'has a default capacity, unless specified' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'can have a variable capacity when initialized' do
      random_capacity = Random.rand(100)
      airport = described_class.new random_capacity
      expect(airport.capacity).to eq random_capacity
    end
  end

  describe '#land_plane' do
    let(:plane) { double(:plane, land: true) }
    context 'when a plane wishes to land' do
      it 'can instruct a plane to land and confirm it has landed' do
        airport.land_plane(plane)
        expect(airport.docked_planes).to include plane
      end
      it 'doesn\'t allow a plane to land when it is stormy' do
        allow(airport).to receive(:bad_weather?) { true }
        message = 'It is stormy and is not safe for the plane to land'
        expect { airport.land_plane(plane) }.to raise_error message
      end
      it 'doesn\'t allow a plane to land if airport is full' do
         airport.capacity.times { airport.land_plane(plane) }
         expect { airport.land_plane(plane) }.to raise_error 'Airport full'
      end
    end
  end

  describe '#launch_plane' do
    let(:plane) { double(:plane, land: false, take_off: true ) }
    before(:each) do
      airport.land_plane(plane)
      allow(airport).to receive(:bad_weather?) { false }
    end
    context 'when a plane wishes to take off' do
      it 'can instruct a plane to take off and confirm it has left' do
        airport.launch_plane(plane)
        expect(airport.docked_planes).not_to include plane
      end
      it 'doesn\'t allow a plane to take off when it is stormy' do
        allow(airport).to receive(:bad_weather?) { true }
        message = 'It is stormy and is not safe for the plane to take off'
        expect { airport.launch_plane(plane) }.to raise_error message
      end
    end
  end



end
