require 'airport'

describe Airport do

  let(:weather_clear) { double("weather never stormy", :stormy? => false) }
  let(:weather_stormy) { double("weather never stormy", :stormy? => true) }
  let(:plane_flying) { double("flying plane", :flying? => true, :land => false, :takeoff => true) }
  let(:plane_grounded) { double("flying plane", :flying? => false, :land => false, :takeoff => true) }

  describe '.build_plane' do
    it 'builds a plane' do
      subject.build_plane
      expect(subject.planes.count).to eq(1)
      expect(subject.planes[0].flying?).to eq(false)
    end
  end

  describe '.land(plane)' do

    it 'lands with clear skys' do
      subject = Airport.new(weather_clear)
      expect(subject.land(plane_flying)).to eq(plane_flying)
      expect(subject.planes.count).to eq(1)
    end
    it 'doesn\'t land with stormy skys' do
      subject = Airport.new(weather_stormy)
      expect { subject.land(plane_flying) }.to raise_error(Airport::ERR_STORMY_LAND)
    end

    it 'cannot land the same plane twice' do
      subject = Airport.new(weather_clear)
      subject.land(plane_flying)
      expect { subject.land(plane_flying) }.to raise_error(Airport::ERR_DUPLICATE_PLANE)
    end

    it 'cannot land grounded plane' do
      subject = Airport.new(weather_clear)
      expect { subject.land(plane_grounded) }.to raise_error(Airport::ERR_PLANE_BAD_STATE)
    end

  end

  describe '.takeoff(plane)' do
    it 'takes off with clear skys' do
      subject = Airport.new(weather_clear)
      subject.build_plane
      plane = subject.planes[0]
      expect(subject.planes.count).to eq(1)
      expect(subject.takeoff(plane)).to eq(plane)
      expect(subject.planes.count).to eq(0)
    end
    it 'doesn\'t take off with stormy skys' do
      subject = Airport.new(weather_stormy)
      subject.build_plane
      plane = subject.planes[0]
      expect(subject.planes.count).to eq(1)
      expect { subject.takeoff(plane) }.to raise_error(Airport::ERR_STORMY_TAKEOFF)
    end

    it 'cannot takeoff a plane it does not have' do
      subject = Airport.new(weather_clear)
      expect { subject.takeoff(plane_grounded) }.to raise_error(Airport::ERR_MISSING_PLANE)
    end

    it 'cannot takeoff a flying plane' do
      subject = Airport.new(weather_clear)
      subject.land(plane_flying)
      expect { subject.takeoff(plane_flying) }.to raise_error(Airport::ERR_PLANE_BAD_STATE)
    end

  end

  describe '.plane_exists?(plane)' do
    it 'finds the plane' do
      subject.build_plane
      plane = subject.planes[0]
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
        subject = Airport.new(double(), 15)
        expect(subject.capacity).to eq(15)
      end

      it 'will not have more planes than capacity' do
        subject = Airport.new(double(), 1)
        subject.build_plane
        expect { subject.build_plane }.to raise_error(Airport::ERR_CAPACITY)

      end

    end
  end
end
