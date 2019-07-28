require 'airport.rb'

describe Airport do

  it 'should respond to land planes' do
    airport = Airport.new
    expect(airport).to respond_to :land_plane
  end

  describe '#land_lane' do

    it 'Should add a plane to landed_planes'  do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land_plane
      expect(airport1.landed_plane.count).to eq (airport2.landed_plane.count + 1)
    end

  end

end
