require 'airport'

describe Airport do
  
  alias_method :airport, :subject

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:capacity=) }

  describe '#initialize' do
    it 'initializes with a capacity of DEFAULT_CAPACITY' do
      expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'accepts optional climate parameter' do
      climate = double(:climate, :is_a? => true)
      expect { Airport.new(climate) }.to_not raise_error
    end

    context 'climate parameter is not an instance of climate' do
      before(:example) do
        @not_a_climate = double(:climate)
        allow(@not_a_climate).to receive(:is_a?).with(Climate).and_return(false)
      end

      it 'raises error' do
        expect { Airport.new(@not_a_climate) }.to raise_error 'Error: Parameter is not a climate.'
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
      special_plane = double(:plane, :is_a? => true)
      expect { airport.build_plane(special_plane) }.to_not raise_error
    end

    context 'a non-plane is specified' do
      before(:example) do
        @non_plane = double(:plane)
        allow(@non_plane).to receive(:is_a?).with(Plane).and_return(false)
      end

      it 'throws error' do
        expect { airport.build_plane(@non_plane) }.to raise_error "Error: The airport can only build planes."
      end
    end
        
  end

  describe '#conditions' do
    before(:example) do
      @sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
      @airport = Airport.new(@sunny_climate)
    end

    it 'checks climate\'s conditions' do
      expect(@sunny_climate).to receive(:conditions)
      @airport.conditions
    end
  end

  describe '#dock_plane' do
    before(:example) do
      sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
      @plane = double(:plane, :land => true, :confirm_landing => true)
      @airport = Airport.new(sunny_climate)
    end

    context 'conditions are sunny' do
      it 'tells plane to land' do
        expect(@plane).to receive(:land)
        @airport.dock_plane(@plane)
      end

      it 'adds plane to Airport\'s @planes array' do
        @airport.dock_plane(@plane)
        expect(@airport.planes).to include @plane 
      end

      it 'tells plane to confirm landing' do
        expect(@plane).to receive(:confirm_landing)
        @airport.dock_plane(@plane)
      end
    end

    context 'airport is at maximum capacity' do
      it 'does not allow plane to land' do
        @airport.capacity.times { @airport.build_plane }
        expect { @airport.dock_plane(@plane) }.to raise_error "Error: Landing not possible when airport is full."
      end
    end

    context 'conditions are stormy' do
      before(:example) do
        stormy_climate = double(:climate, :is_a? => true, :conditions => :stormy)
        @plane = double(:plane, :is_a? => true, :land => true, :confirm_landing => true)
        @airport = Airport.new(stormy_climate)
      end

      it 'does not allow plane to land' do
        expect { @airport.dock_plane(@plane) }.to raise_error "Error: Landing forbidden when weather is stormy."
      end
    end

  end

  describe '#release_plane' do

    before(:example) do
      sunny_climate = double(:climate, :is_a? => true, :conditions => :sunny)
      @plane = double(:plane, :is_a? => true, :take_off => true, :confirm_take_off => true)
      @airport = Airport.new(sunny_climate)
    end

    context 'conditions are sunny' do
      it 'tells plane to take off' do
        @airport.build_plane(@plane)
        expect(@plane).to receive(:take_off)
        @airport.release_plane(@plane)
      end

      it 'removes plane from Airport\'s @planes array' do
        @airport.build_plane(@plane)
        @airport.release_plane(@plane)
        expect(@airport.planes).to_not include @plane
      end

      it 'tells plane to confirm take off' do
        @airport.build_plane(@plane)
        expect(@plane).to receive(:confirm_take_off)
        @airport.release_plane(@plane)
      end
    end

    context 'conditions are stormy' do
      before(:example) do
        stormy_climate = double(:climate, :is_a? => true, :conditions => :stormy)
        @plane = double(:plane, :is_a? => true, :take_off => true, :confirm_take_off => true)
        @airport = Airport.new(stormy_climate)
      end

      it 'does not allow take off' do
        @airport.build_plane(@plane)
        expect { @airport.release_plane(@plane) }.to raise_error 'Error: Take-off forbidden when weather is stormy.'
      end
    end

    context 'plane is not in the airport' do
      it 'raises error' do
        expect(@airport.planes).to be_empty
        expect { @airport.release_plane(@plane) }.to raise_error "Error: Plane is not in the airport"
      end
    end

  end

end
