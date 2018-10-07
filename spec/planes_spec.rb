require 'planes'

# SUBJECT: Plane
# Message:
# land plane
# take off

describe Plane do

  it 'returns a plane' do
  end

  it 'initialize with a destination' do
    airport_double = double
    plane1 = Plane.new(airport_double)
    expect(plane1.destination).to eq airport_double
  end
end
