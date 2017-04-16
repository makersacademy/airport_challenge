require 'airport'

describe Airport do
  
  alias_method :airport, :subject

  it { is_expected.to respond_to(:planes) }

  describe '#initialize' do
    it 'does not require user to provide climate parameter' do
      expect{ Airport.new }.to_not raise_error
    end

    context 'climate parameter is not an instance of climate' do
      it 'raises error' do
        not_a_climate = double(:climate)
        allow(not_a_climate).to receive(:is_a?).with(Climate).and_return(false)
        expect{ Airport.new(not_a_climate) }.to raise_error 'Error: Parameter is not a climate.'
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
      sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
      airport = Airport.new(sunny_climate)

      expect(sunny_climate).to receive (:conditions)
      airport.conditions
    end
  end

  describe '#dock_plane' do
    it 'tells plane to land' do
      sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
      plane = double(:plane, :land => true)
      airport = Airport.new(sunny_climate)

      expect(plane).to receive(:land)
      airport.dock_plane(plane)
    end

    it 'adds plane to Airport\'s @planes array' do
      sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
      plane = double(:plane, :land => true)
      airport = Airport.new(sunny_climate)

      airport.dock_plane(plane)
      expect(airport.planes).to include plane 
    end
  end

  describe '#release_plane' do
    it 'tells plane to take off' do
      sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
      plane = double(:plane, :land => true, :take_off => true)
      airport = Airport.new(sunny_climate)

      airport.dock_plane(plane)
      expect(plane).to receive(:take_off)
      airport.release_plane(plane)
    end

    it 'removes plane from Airport\'s @planes array' do
      sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
      plane = double(:plane, :land => true, :take_off => true)
      airport = Airport.new(sunny_climate)

      airport.dock_plane(plane)
      airport.release_plane(plane)
      expect(airport.planes).to_not include plane
    end

    it 'checks airport conditions' do
      sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
      plane = double(:plane, :land => true, :take_off => true)
      airport = Airport.new(sunny_climate)

      airport.dock_plane(plane)
      expect(airport).to receive(:conditions)
      airport.release_plane(plane)
    end

    context 'conditions are stormy' do
      it 'does not allow take off' do
        stormy_climate = double(:climate, :is_a? => true, :conditions => :stormy)
        plane = double(:plane, :land => true, :take_off => true)
        airport = Airport.new(stormy_climate)

        airport.dock_plane(plane)
        srand_stormy_weather
        expect{ airport.release_plane(plane) }.to raise_error 'Error: Take-off forbidden when weather is stormy.'
      end
    end

  end

end


