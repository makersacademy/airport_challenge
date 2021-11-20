require 'airport'

describe Airport do
  it 'can respond to plane' do
    airport = Airport.new
    plane = Plane.new
    expect(airport).to respond_to(:plane)
  end

  it 'should land a plane' do
    airport = Airport.new
    plane = Plane.new
    expect(airport).to respond_to(:plane(land)) # .with(1).argument
  end
end


# should land a plane in the airport