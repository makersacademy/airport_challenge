require 'airport'

describe Airport do

  describe '.build_plane' do
    it 'builds a plane' do
      subject.build_plane
      expect(subject.planes.count).to eq(1)
      expect(subject.planes[0].flying?).to eq(false)
    end
  end

  describe '.land(plane)' do
    it 'lands with clear skys' do
      weather = double("weather never stormy", :stormy? => false)
      plane = double("flying plane", :flying? => true, :land => false)
      subject = Airport.new(weather)
      expect(subject.land(plane)).to eq(plane)
      expect(subject.planes.count).to eq(1)
    end
    it 'doesn\'t land with stormy skys' do
      weather = double("weather stormy", :stormy? => true)
      plane = double("flying plane", :flying? => true, :land => false)
      subject = Airport.new(weather)
      # Option 1
      # expect(subject.land(plane)).to eq(nil)
      # Option 2
      expect { subject.land(plane) }.to raise_error(Airport::ERR_STORMY_LAND)
    end

    it 'cannot land the same plane twice' do
      weather = double("weather never stormy", :stormy? => false)
      plane = double("flying plane", :flying? => true, :land => false)
      subject = Airport.new(weather)
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error(Airport::ERR_DUPLICATE_PLANE)
    end

    it 'cannot land grounded plane' do
      weather = double("weather never stormy", :stormy? => false)
      plane = double("flying plane", :flying? => false, :land => false)
      subject = Airport.new(weather)
      expect { subject.land(plane) }.to raise_error(Airport::ERR_PLANE_BAD_STATE)

    end

  end

  describe '.takeoff(plane)' do
    it 'takes off with clear skys' do
      weather = double("weather never stormy", :stormy? => false)
      subject = Airport.new(weather)
      subject.build_plane
      plane = subject.planes[0]
      expect(subject.planes.count).to eq(1)
      expect(subject.takeoff(plane)).to eq(plane)
      expect(subject.planes.count).to eq(0)
    end
    it 'doesn\'t take off with stormy skys' do
      weather = double("weather never stormy", :stormy? => true)
      subject = Airport.new(weather)
      subject.build_plane
      plane = subject.planes[0]
      expect(subject.planes.count).to eq(1)
      # Option 1
      # expect(subject.takeoff(plane)).to eq(nil)
      # expect(subject.planes.count).to eq(1)
      # Option 2
      expect { subject.takeoff(plane) }.to raise_error(Airport::ERR_STORMY_TAKEOFF)
    end

    it 'cannot takeoff a plane it does not have' do
      weather = double("weather never stormy", :stormy? => false)
      subject = Airport.new(weather)
      plane = double("any grounded plane", :flying? => false)
      expect { subject.takeoff(plane) }.to raise_error(Airport::ERR_MISSING_PLANE)
    end

    it 'cannot takeoff a flying plane' do
      weather = double("weather never stormy", :stormy? => false)
      subject = Airport.new(weather)
      plane = double("any grounded plane", :flying? => true, :land => false)
      subject.land(plane)
      expect { subject.takeoff(plane) }.to raise_error(Airport::ERR_PLANE_BAD_STATE)
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
        weather = double()
        subject = Airport.new(weather, 15)
        expect(subject.capacity).to eq(15)
      end

      it 'will not have more planes than capacity' do
        weather = double()
        subject = Airport.new(weather, 1)
        subject.build_plane
        expect { subject.build_plane }.to raise_error(Airport::ERR_CAPACITY)

      end

    end
  end
end
