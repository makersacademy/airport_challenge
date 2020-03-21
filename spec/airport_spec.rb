require 'airport'

describe '#land(plane)' do

  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  context 'Airport can #land planes' do

    it 'Airport responds to #land' do
      expect(airport).to respond_to(:land)
    end

    it 'Plane lands in airport' do
      expect(airport.land).to be_instance_of(Plane)
    end

  end

  context 'Airport can #take_off planes' do

    it 'Airport responds to #take_off' do
      expect(airport).to respond_to(:take_off)
    end

    it 'Airport responds to #view_planes' do
      expect(airport).to respond_to(:view_planes)
    end

    it '#view_plane confirms #take_off' do
      landed_plane = airport.land
      airport.take_off
      expect(airport.view_planes).to_not be([landed_plane])
    end

  end

end
