require 'airport'

describe Airport do
  alias_method :airport, :subject

  it { is_expected.to respond_to(:planes) }

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

    it 'checks airport conditions' do
      plane = double(:plane, :land => true, :take_off => true)
      airport.dock_plane(plane)
      expect(airport).to receive(:conditions)
      airport.release_plane(plane)
    end

    context 'conditions are stormy' do
      it 'does not allow take off' do
        plane = double(:plane, :land => true, :take_off => true)
        airport.dock_plane(plane)
        srand(5)
        expect{ airport.release_plane(plane) }.to raise_error 'Error: Take-off forbidden when weather is stormy.'
      end
    end

  end

end


