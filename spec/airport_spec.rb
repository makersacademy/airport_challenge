require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:weather) { double :weather, :stormy? => false }
  subject(:airport) { described_class.new(weather) }

  let(:plane) { double(:plane) }
  before(:each) do
    allow(plane).to receive(:land)
  end

  context 'when landing a plane' do
    it 'instructs a plane to land' do
      expect(plane).to receive(:land)
      airport.land_plane(plane)
    end
    it 'docks a plane that has landed in the airport' do
      airport.land_plane(plane)
      expect(airport.has_plane?(plane)).to be true
    end
  end

  context 'when allowing planes to take off' do
    it 'instructs a plane to take off' do
      airport.land_plane(plane)
      expect(plane).to receive(:take_off)
      airport.take_off(plane)
    end
    it 'cannot instruct a plane to take off if it is not in the airport' do
      allow(plane).to receive(:take_off)
      expect{ airport.take_off(plane) }.to raise_error('The plane is not in the airport!')
    end
    it 'does not have a plane after it has taken off' do
      allow(plane).to receive(:take_off)
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.has_plane?(plane)).to be false
    end
  end

  context 'when weather is stormy' do
    before(:each) do
      allow(weather).to receive(:stormy?).and_return true
    end
    it 'prevents plane from taking off' do
      expect { airport.take_off(plane) }.to raise_error('Plane cannot take off in stormy weather!')
    end
    it 'prevents plane from landing' do
      expect { airport.land_plane(plane) }.to raise_error('Plane cannot land in stormy weather!')
    end
  end

  context 'when airport is full' do
    it 'prevents a plane from landing' do
      Airport::DEFAULT_CAPACITY.times { airport.land_plane(plane) }
      expect { airport.land_plane(plane) }.to raise_error('Plane cannot land - airport is full!')
    end
  end

  it 'can be given a specific capacity' do
    capacity = 1
    airport = Airport.new(weather, capacity)
    airport.land_plane(plane)
    expect { airport.land_plane(plane) }.to raise_error('Plane cannot land - airport is full!')
  end

  it 'can land and take off several planes' do
    capacity = 3
    airport = Airport.new(weather, capacity)
    plane_1 = Plane.new
    plane_2 = Plane.new
    plane_3 = Plane.new
    plane_4 = Plane.new
    airport.land_plane(plane_1)
    airport.land_plane(plane_2)
    airport.land_plane(plane_3)
    airport.take_off(plane_2)
    airport.land_plane(plane_4)
    airport.take_off(plane_3)
    airport.take_off(plane_1)
    expect(airport.has_plane?(plane_2)).to be false
    expect(airport.has_plane?(plane_3)).to be false
    expect(airport.has_plane?(plane_1)).to be false
    expect(airport.has_plane?(plane_4)).to be true
  end
end
