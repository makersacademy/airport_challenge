require 'airport.rb'

describe Airport do
  it 'expects a class which creates instances' do
    expect(Airport.new).to be_a(Airport)
  end

  it 'can respond to message land_plane' do
    expect(Airport.new).to respond_to(:land_plane)
  end

  it 'can respond to message take_off' do
    expect(Airport.new).to respond_to(:take_off)
  end

  it 'can confirm if plane is no longer in the airport' do
    air = Airport.new
    plane = Plane.new
    air.land_plane(plane)
    air.take_off(plane)
    expect(air.plane_check(plane)).to eq(false)
  end

end
