require 'airport'

srand_sunny_weather = srand(1)
srand_stormy_weather = srand(5)

describe Airport do
  
  alias_method :airport, :subject

  it { is_expected.to respond_to(:planes) }

  describe '#initialize' do
    it 'does not require user to provide climate parameter' do
      expect{ Airport.new }.to_not raise_error
    end

    context 'climate parameter is not an instance of climate' do
      it 'raises error' do
        expect{ Airport.new(55) }.to raise_error 'Error: Parameter is not a climate.'
      end
    end
  end

  describe '#climate' do
    it 'returns an instance of the Climate class' do
      expect(airport.climate).to be_an_instance_of Climate
    end
  end

  describe '#conditions' do
    it 'checks climate\'s conditions' do
      climate = airport.climate
      expect(climate).to receive (:conditions)
      airport.conditions
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
      plane = double(:plane, :land => true, :take_off => true)
      airport.dock_plane(plane)
      srand_sunny_weather
      expect(plane).to receive(:take_off)
      airport.release_plane(plane)
    end

    it 'removes plane from Airport\'s @planes array' do
      plane = double(:plane, :land => true, :take_off => true)
      airport.dock_plane(plane)
      expect(airport.planes).to include plane
      srand_sunny_weather
      airport.release_plane(plane)
      expect(airport.planes).to_not include plane
    end

    it 'checks airport conditions' do
      plane = double(:plane, :land => true, :take_off => true)
      airport.dock_plane(plane)
      expect(airport).to receive(:conditions)
      srand_sunny_weather
      airport.release_plane(plane)
    end

    context 'conditions are stormy' do
      it 'does not allow take off' do
        plane = double(:plane, :land => true, :take_off => true)
        airport.dock_plane(plane)
        srand_stormy_weather
        expect{ airport.release_plane(plane) }.to raise_error 'Error: Take-off forbidden when weather is stormy.'
      end
    end

  end

end


