require 'plane'

describe Plane do

  it { is_expected.to respond_to :land }

  it 'has the plane after landing' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.planes).to include plane
  end

end
