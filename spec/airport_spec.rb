require 'airport'

describe Airport do
  
  alias_method :airport, :subject

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:capacity=) }

  describe '#initialize' do
    it 'is expected to initialize with a capacity of DEFAULT_CAPACITY' do
      expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'does not require user to provide climate parameter' do
      expect { Airport.new }.to_not raise_error
    end

    it 'accepts optional climate parameter' do
      climate = double(:climate, :is_a? => true)
      expect { Airport.new(climate) }.to_not raise_error
    end

    context 'climate parameter is not an instance of climate' do
      it 'raises error' do
        not_a_climate = double(:climate)
        allow(not_a_climate).to receive(:is_a?).with(Climate).and_return(false)
        expect { Airport.new(not_a_climate) }.to raise_error 'Error: Parameter is not a climate.'
      end
    end
  end

  describe '#build_plane' do
    it 'creates new plane in airport\'s dock' do
      expect(airport.planes).to be_empty
      airport.build_plane
      expect(airport.planes.count).to eq 1
      expect(airport.planes[0]).to be_an_instance_of(Plane)
    end

    it 'takes an optional argument that specifies a custom plane' do
      special_plane = Plane.new
      expect { airport.build_plane(special_plane) }.to_not raise_error
    end

    context 'a non-plane is specified' do
      it 'throws error' do
        non_plane = double(:plane)
        allow(non_plane).to receive(:is_a?).with(Plane).and_return(false)
        expect { airport.build_plane(non_plane) }.to raise_error "Error: The airport can only build planes."
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

      expect(sunny_climate).to receive(:conditions)
      airport.conditions
    end
  end

  describe '#dock_plane' do

    context 'plane has already landed' do
      it 'raises error' do
        sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
        plane = double(:plane, :land => true, :landed => true)
        airport = Airport.new(sunny_climate)

        expect { airport.dock_plane(plane) }.to raise_error "Error: Plane has already landed."
      end
    end

    context 'conditions are sunny' do
      it 'tells plane to land' do
        sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
        plane = double(:plane, :land => true, :landed => nil)
        airport = Airport.new(sunny_climate)

        expect(plane).to receive(:land)
        airport.dock_plane(plane)
      end

      it 'adds plane to Airport\'s @planes array' do
        sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
        plane = double(:plane, :land => true, :landed => nil)
        airport = Airport.new(sunny_climate)

        airport.dock_plane(plane)
        expect(airport.planes).to include plane 
      end
    end

    context 'airport is at maximum capacity' do
      it 'does not allow plane to land' do
        sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
        plane = double(:plane, :land => true, :landed => nil)
        airport = Airport.new(sunny_climate)

        airport.capacity.times { airport.build_plane }
        expect { airport.dock_plane(plane) }.to raise_error "Error: Landing not possible when airport is full."
      end
    end

    context 'conditions are stormy' do
      it 'does not allow plane to land' do
        stormy_climate = double(:climate, :is_a? => true, :conditions => :stormy)
        plane = double(:plane, :land => true, :landed => nil)
        airport = Airport.new(stormy_climate)
        
        expect { airport.dock_plane(plane) }.to raise_error "Error: Landing forbidden when weather is stormy."
      end
    end

  end

  describe '#release_plane' do
    context 'plane is not in the airport' do
      it 'raises error' do
        sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
        plane = double(:plane, :take_off => true)
        airport = Airport.new(sunny_climate)

	expect(airport.planes).to be_empty
        expect { airport.release_plane(plane) }.to raise_error "Error: This plane is not in the airport"
      end
    end

    it 'checks climate conditions' do
      sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
      plane = double(:plane, :land => true, :take_off => true, :landed => nil)
      airport = Airport.new(sunny_climate)

      airport.dock_plane(plane)
      expect(airport).to receive(:conditions)
      airport.release_plane(plane)
    end

    context 'conditions are sunny' do
      it 'tells plane to take off' do
        sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
        plane = double(:plane, :land => true, :take_off => true, :landed => nil)
        airport = Airport.new(sunny_climate)

        airport.dock_plane(plane)
        expect(plane).to receive(:take_off)
        airport.release_plane(plane)
      end

      it 'removes plane from Airport\'s @planes array' do
        sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
        plane = double(:plane, :land => true, :take_off => true, :landed => nil)
        airport = Airport.new(sunny_climate)

        airport.dock_plane(plane)
        airport.release_plane(plane)
        expect(airport.planes).to_not include plane
      end
    end

    context 'conditions are stormy' do
      it 'does not allow take off' do
        stormy_climate = double(:climate, :is_a? => true, :conditions => :stormy)
        plane = double(:plane, :is_a? => true, :take_off => true)
        airport = Airport.new(stormy_climate)
        airport.build_plane(plane)

        expect { airport.release_plane(plane) }.to raise_error 'Error: Take-off forbidden when weather is stormy.'
      end
    end
  end

end
