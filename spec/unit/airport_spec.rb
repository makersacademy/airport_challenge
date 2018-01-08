require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  before do
    airport.instance_variable_set(:@weather_condition, :sunny)
  end
  
  it 'has a default hangar capacity of 10' do
    expect(airport.hangar_capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'sets hangar capacity as an argument' do
    large_airport = Airport.new(15)
    expect(large_airport.hangar_capacity).to eq 15
  end

  describe '#land' do
    it 'airport has plane after landing' do
      airport.land(plane)
      expect(airport.hangar).to include plane
    end

    it 'prevents landing when weather is stormy' do
      airport.instance_variable_set(:@weather_condition, :stormy)
      message = 'Due to current weather conditions planes cannot land'
      expect { airport.land(plane) }.to raise_error message
    end

    it 'prevents landing when hangar is full' do
      airport.hangar_capacity.times { airport.land(double :plane) }
      message = 'Planes cannot land due to a lack of hangar space'
      expect { airport.land(plane) }.to raise_error message
    end

    it 'prevents landing if plane already landed' do
      airport.land(plane)
      message = 'Plane has already landed'
      expect { airport.land(plane) }.to raise_error message
    end

  end

  describe '#takeoff' do
    it 'plane is gone after takeoff' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.hangar).not_to include plane
    end

    it 'prevents takeoff when weather is stormy' do
      airport.land(plane)
      airport.instance_variable_set(:@weather_condition, :stormy)
      message = 'Due to current weather conditions all planes are grounded'
      expect { airport.takeoff(plane) }.to raise_error message
    end

    it 'prevents takeoff if plane is not in the hangar' do
      message = 'That plane has not landed at this airport'
      expect { airport.takeoff(plane) }.to raise_error message
    end

  end

end
