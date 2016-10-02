require 'airport'
require 'plane'

describe Airport do
  let(:weather) do 
    weather_double = double(:weather)
    allow(weather_double).to receive(:current_weather).and_return :sunny
    weather_double
  end
  
  subject(:airport) { described_class.new(weather) }
  let(:plane) { double(:plane) }

  context 'when landing a plane' do
    it 'instructs a plane to land' do
      allow(plane).to receive(:landed?)
      expect(plane).to receive(:land)
      airport.land_plane(plane)
    end
    it 'only docks a plane that has landed in the airport' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed?).and_return true
      airport.land_plane(plane)
      expect(airport.planes).to include plane 
    end
    it 'cannot dock a plane that has not landed' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed?).and_return false
      airport.land_plane(plane)
      expect(airport.planes).not_to include plane
    end
  end

  context 'when allowing planes to take off' do
    it 'instructs a plane to take off' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed?).and_return true
      airport.land_plane(plane)
      expect(plane).to receive(:take_off)
      airport.take_off(plane)
    end
    it 'cannot instruct a plane to take off if it is not in the airport' do
      allow(plane).to receive(:take_off)
      expect{ airport.take_off(plane) }.to raise_error('The plane is not in the airport!')
    end
    it 'does not have a plane after it has taken off' do
      plane_1 = Plane.new
      plane_2 = Plane.new
      plane_3 = Plane.new
      airport.land_plane(plane_1)
      airport.land_plane(plane_2)
      airport.land_plane(plane_3)
      airport.take_off(plane_2)
      expect(airport.planes).not_to include plane_2
    end
  end

  context 'when weather is stormy' do
    before(:each) do
      allow(weather).to receive(:current_weather).and_return :stormy
    end
    it 'prevents plane from taking off' do
      expect { airport.take_off(plane) }.to raise_error('Plane cannot take off in stormy weather!')
    end
    it 'prevents plane from landing' do
      expect { airport.land_plane(plane) }.to raise_error('Plane cannot land in stormy weather!')
    end
  end

end