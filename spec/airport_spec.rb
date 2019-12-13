require 'airport'

describe Airport do
  it 'instantiates an airport class' do
    airport = Airport.new
    expect(airport).to be_a_kind_of Airport
  end
end

describe Plane do
  it 'instantiates a plane class' do
    plane = Plane.new
    expect(plane).to be_a_kind_of Plane
  end
end
