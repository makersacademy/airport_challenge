require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  it 'responds to land_plane method' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'responds to take_off method' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  describe '#land_plane' do
    it 'allows airport to accept a plane and store it' do
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end

    it 'accepts instances of Plane class' do
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.planes[-1]).to be_instance_of Plane
    end
  end

end
