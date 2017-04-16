require 'airport'

describe Airport do
  alias_method :airport, :subject

  it { is_expected.to respond_to(:planes) }

  describe '#weather' do
    it 'returns an instance of the Weather class' do
      expect(airport.weather).to be_an_instance_of Weather
    end
  end

  describe '#dock_plane' do
    it 'tells plane to land' do
      plane = double(:plane, :land => true)
      expect(plane).to receive(:land)
      airport.dock_plane(plane)
    end

    it 'adds plane to Airport\'s @planes array' do
      plane = double(:plane, :land => true)
      airport.dock_plane(plane)
      expect(airport.planes).to include plane 
    end
  end

  describe '#release_plane' do
    it 'tells plane to take off' do
      plane = double(:plane, :take_off => true)
      expect(plane).to receive(:take_off)
      airport.release_plane(plane)
    end

    it 'removes plane from Airport\'s @planes array' do
      plane = double(:plane, :land => true, :take_off => true)
      airport.dock_plane(plane)
      expect(airport.planes).to include plane
      airport.release_plane(plane)
      expect(airport.planes).to_not include plane
    end
  end

end
