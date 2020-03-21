require 'airport'

describe 'Airport' do

  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  context 'Airport can #land planes' do

    it 'Airport responds to #land' do
      expect(airport).to respond_to(:land)
    end

    it 'Plane lands in airport' do
      expect(airport.land).to be_instance_of(Plane)
    end

    it "Plane  won't land if airport is full" do
      airport.land
      expect { airport.land }.to raise_error 'Airport Full'
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

  context 'Given a Capacity' do

    it "Plane  won't land if above capacity" do
      new_airport = Airport.new(72)
      72.times { new_airport.land }
      expect { new_airport.land }.to raise_error 'Airport Full'
    end

  end

  context 'Assess weather?' do

    it 'Airport responds to #stormy?' do
      expect(airport).to respond_to(:stormy?)
    end

    it 'Airport responds to #check_weather' do
      expect(airport).to respond_to(:check_weather)
    end

  end
end
