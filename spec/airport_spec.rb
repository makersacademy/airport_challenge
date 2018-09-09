require 'pry'
require 'airport'

RSpec.describe Airport do

  subject(:airport) { described_class.new(weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  context 'when the weather is sunny' do

    before do
      allow(weather).to receive(:forecast).and_return(:sunny)
    end

    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
    it 'should land a plane' do
      expect(plane).to receive(:land)
      allow(airport).to receive(:full?).and_return(false)
      expect { airport.land(plane) }.to_not raise_error
    end

    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'should allow a plane to take off and return the plane' do
      expect(plane).to receive(:land)
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end

  end

  context 'when weather is stormy' do

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent takeoff when weather is stormy 
    it 'should not allow a plane to take off' do
      expect(plane).to receive(:land)
      allow(weather).to receive(:forecast).and_return(:sunny)
      airport.land(plane)
      allow(weather).to receive(:forecast).and_return(:stormy)
      expect { airport.take_off(plane) }.to raise_error('It is too stormy to take off')
    end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when weather is stormy 
    it 'should not allow a plane to land' do
      allow(weather).to receive(:forecast).and_return(:stormy)
      expect { airport.land(plane) }.to raise_error('It is too stormy to land')
    end

  end

  context 'when the plane is not at the airport' do

    it 'should not take off from the airport' do
      expect { airport.take_off(plane) }.to raise_error 'The plane is not at this airport'
    end

  end

  context 'when airport full' do
    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when the airport is full
    it 'should not land' do
      allow(weather).to receive(:forecast).and_return(:sunny)
      until airport.full? do
        mock_plane = double('mock_plane')
        expect(mock_plane).to receive(:land)
        airport.land(mock_plane)
      end
      expect { airport.land(plane) }.to raise_error 'The airport is full'
    end
  end

  context 'when airport capacity is set to 1' do
    it 'should only allow one plane to land' do
      airport = Airport.new(weather, 1)
      allow(weather).to receive(:forecast).and_return(:sunny)
      mock_plane = double('mock_plane')
      expect(mock_plane).to receive(:land)
      airport.land(mock_plane)
      expect { airport.land(plane) }.to raise_error 'The airport is full'
    end
  end

  context 'when plane is already at the airport' do
    it 'should not be able to land again' do
      allow(weather).to receive(:forecast).and_return(:sunny)
      expect(plane).to receive(:land)
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error 'The plane is already at the airport'
    end
  end
  
end
