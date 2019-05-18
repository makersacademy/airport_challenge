require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { instance_double("Plane", :grounded= => true, :grounded => false) }
  let(:grounded_plane) { instance_double("Plane", :grounded => true) }
  let(:stormy) { instance_double("Weather", :stormy? => true) }
  let(:sunny) { instance_double("Weather", :stormy? => false) }
  # look into the 'before' syntax to set conditions
  # for multiple tests
  it 'should allow user to set capacity of new instance' do
    expect(Airport.new(50).capacity).to equal(50)
  end
  
  it 'should store landed planes in hangar' do
    airport.land(plane, sunny)
    expect(airport.hangar).to eq([plane])
  end  
  
  context 'with nice weather' do
    it 'should let the requested plane take off' do
      unique_plane = plane
      airport.land(unique_plane, sunny)
      expect(airport.take_off(unique_plane, sunny)).to eq(unique_plane)
    end
    it 'should no longer store the plane after take off' do
      airport.land(plane, sunny)
      airport.take_off(plane, sunny)
      expect(airport.hangar).to eq([])
    end
    it 'should only allow take off of planes in hangar' do
      airport.land(plane, sunny)
      plane2 = Plane.new
      expect { airport.take_off(plane2, sunny) }.to raise_error('Plane not at specified airport')
    end
    it 'should not allow plane grounded elsewhere to land' do
      expect { airport.land(grounded_plane, sunny) }.to raise_error('Plane is grounded elsewhere')
    end
  end
  
  context 'with stormy weather' do
    it 'should not let planes take off' do
      airport.land(plane, sunny)
      expect { airport.take_off(plane, stormy) }.to raise_error('Planes grounded: stormy weather!')
    end
    it 'should not let planes land' do
      expect { airport.land(plane, stormy) }.to raise_error('Airport currently closed due to stormy weather')
    end
  end

  context 'when it\'s full' do
    it 'should not let planes land' do
      test_port = Airport.new
      Airport::DEFAULT_CAPACITY.times { test_port.land(Plane.new, sunny) }
      expect { test_port.land(Plane.new, sunny) }.to raise_error('Airport is full')
    end
  end
end
