require 'airport'


describe Airport do

  it 'should confirm a plane has landed' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to include(plane)
  end

end
