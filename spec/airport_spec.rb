require './lib/Airport'
require './lib/Plane'

describe Airport do

  it 'airport controller can instruct plane to take off' do
    expect(Airport.new).to respond_to :takeoff_plane
end

 it 'airport logs the plane as being in airport on landing' do
    EMA = Airport.new
    plane_to_land = Plane.new
    land_plane.takeoff
    EMA.land_plane(plane_to_land)
    #need way to access array attr_accessor
    expect(@planes[0].landed).to eq(true)
end

# Plane has state landed so cannot be landed again
#More planes can be landed at that airport


# it 'airport takes plane off its 'in airport' list on takeoff'
#done all steps to land plane
#EMA.takeoff_plane
#no plane in array


# Plane is in air so cannot take off

#weather is stormy so plane cannot land

#weather is stormy so plane cannot take off

#set the capacity of airport


end
