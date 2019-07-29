require 'airport'

describe Airport do

  let(:weather_clear) { double("weather never stormy", :stormy? => false) }
  let(:weather_stormy) { double("weather never stormy", :stormy? => true) }
  let(:plane_flying) { double("flying plane", :flying? => true, :land => false, :takeoff => true) }
  let(:plane_grounded) { double("flying plane", :flying? => false, :land => false, :takeoff => true) }

  before() { @airport_clear = Airport.new(weather_clear) }
  before() { @airport_stormy = Airport.new(weather_stormy) }

  describe '.build_plane' do

    it 'builds a plane' do
      plane = subject.build_plane
      expect(subject.planes.count).to eq(1)
      expect(plane.flying?).to eq(false) # should be tested in plane_Spec
      expect(plane).to be_a(Plane)
    end

  end

  describe '.land(plane)' do

    it 'lands with clear skys' do
      expect(@airport_clear.land(plane_flying)).to eq(plane_flying)
      expect(@airport_clear.planes.count).to eq(1)
    end

    it 'doesn\'t land with stormy skys' do
      expect { @airport_stormy.land(plane_flying) }.to raise_error(Airport::ERR_STORMY_LAND)
    end

    it 'cannot land the same plane twice' do
      @airport_clear.land(plane_flying)
      expect { @airport_clear.land(plane_flying) }.to raise_error(Airport::ERR_DUPLICATE_PLANE)
    end

    it 'cannot land grounded plane' do
      expect { @airport_clear.land(plane_grounded) }.to raise_error(Airport::ERR_PLANE_BAD_STATE)
    end

  end

  describe '.takeoff(plane)' do

    it 'takes off with clear skys' do
      @airport_clear.build_plane
      plane = @airport_clear.planes[0]
      expect(@airport_clear.planes.count).to eq(1)
      expect(@airport_clear.takeoff(plane)).to eq(plane)
      expect(@airport_clear.planes.count).to eq(0)
    end

    it 'doesn\'t take off with stormy skys' do
      plane = @airport_stormy.build_plane
      expect(@airport_stormy.planes.count).to eq(1)
      expect { @airport_stormy.takeoff(plane) }.to raise_error(Airport::ERR_STORMY_TAKEOFF)
    end

    it 'cannot takeoff a plane it does not have' do
      expect { @airport_clear.takeoff(plane_grounded) }.to raise_error(Airport::ERR_MISSING_PLANE)
    end

    it 'cannot takeoff a flying plane' do
      @airport_clear.land(plane_flying)
      expect { @airport_clear.takeoff(plane_flying) }.to raise_error(Airport::ERR_PLANE_BAD_STATE)
    end

  end

  describe '.plane_exists?(plane)' do
    it 'finds the plane' do
      plane = subject.build_plane
      expect(subject.plane_exists?(plane)).to eq(true)
    end
  end

  context 'with default parameters' do
    describe '.capacity' do
      it 'has default capacity' do
        expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
      end
    end
  end

  context 'with custom parameters' do
    describe '.capacity' do
      it 'has custom capacity' do
        airport_capacity = Airport.new(double(), 15)
        expect(airport_capacity.capacity).to eq(15)
      end

      it 'will not have more planes than capacity' do
        airport_capacity_small = Airport.new(double(), 1)
        airport_capacity_small.build_plane
        expect { airport_capacity_small.build_plane }.to raise_error(Airport::ERR_CAPACITY)

      end

    end
  end
end
