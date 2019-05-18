require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:stormy) { instance_double("Weather", :stormy? => true) }
  let(:clear) { instance_double("Weather", :stormy? => false) }
  
  it 'should allow user to set capacity of new instance' do
    # large_airport = Airport.new(50)
    expect(Airport.new(50).capacity).to equal(50)
  end

  it 'should store landed planes in hangar' do
    airport.land(plane, clear)
    expect(airport.hangar).to eq([plane])
  end  
  
  context 'with nice weather' do
    it 'should let the requested plane take off' do
      unique_plane = plane
      airport.land(unique_plane, clear)
      expect(airport.take_off(unique_plane, clear)).to eq(unique_plane)
    end
    it 'should no longer store the plane after take off' do
      airport.land(plane, clear)
      airport.take_off(plane, clear)
      expect(airport.hangar).to eq([])
    end
    it 'should only allow take off of planes in hangar' do
      airport.land(plane, clear)
      plane2 = Plane.new
      expect { airport.take_off(plane2, clear) }.to raise_error('Plane not at specified airport')
    end
  end
  
  context 'with stormy weather' do
    it 'should not let planes take off' do
      airport.land(plane, clear)
      expect { airport.take_off(plane, stormy) }.to raise_error('Planes grounded: stormy weather!')
    end
    it 'should not let planes land' do
      expect { airport.land(plane, stormy) }.to raise_error('Airport currently closed due to stormy weather')
    end
  end

  context 'when it\'s full' do
    it 'should not let planes land' do
      test_port = Airport.new
      Airport::DEFAULT_CAPACITY.times { test_port.land(Plane.new, clear) }
      expect { test_port.land(Plane.new, clear) }.to raise_error('Airport is full')
    end
  end
end
