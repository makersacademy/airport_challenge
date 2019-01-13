require 'airport'

RSpec.describe Airport do

  it 'manual check for capacity' do
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    plane4 = Plane.new
    plane5 = Plane.new
    plane6 = Plane.new
    plane7 = Plane.new
    plane8 = Plane.new
    plane9 = Plane.new
    plane10 = Plane.new
    plane11 = Plane.new

    airport.land(plane1)
    airport.land(plane2)
    airport.land(plane3)
    airport.land(plane4)
    airport.land(plane5)
    airport.land(plane6)
    airport.land(plane7)
    airport.land(plane8)
    airport.land(plane9)
    airport.land(plane10)

    expect { airport.land(plane1).to raise_error('Full') }
  end

end
