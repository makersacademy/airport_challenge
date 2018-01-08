require 'airport'
require 'plane'

describe 'multiple plane test' do
  subject(:airport) { Airport.new }

  before do
    airport.instance_variable_set(:@weather_condition, :sunny)
  end
  it 'allows multiple planes to be in the air, land, and take off' do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    plane4 = Plane.new
    expect do
      airport.land(plane1)
      airport.land(plane2)
      airport.takeoff(plane1)
      airport.land(plane3)
      airport.takeoff(plane2)
      airport.land(plane1)
      airport.land(plane4)
      airport.takeoff(plane3)
      airport.takeoff(plane4)
    end.to_not raise_error
  end
end
