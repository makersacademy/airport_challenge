require './lib/Airport'
require './lib/Plane'

describe Airport do

    it 'airport responds to plane class method to take off' do
    expect(Airport.new).to respond_to :takeoff_plane
end
    it 'airport responds to plane class method to land' do
    expect(Airport.new).to respond_to :land_plane
end

   it 'airport logs that plane is not in airport after take off' do
     ema = Airport.new
     plane = Plane.new
     #set array with a landed plane
     ema.planes << plane
     ema.takeoff_plane
     expect(ema.planes.length).to eq(0)
end

  it 'airport logs the plane as being in airport on landing' do
     ema = Airport.new
     ema.land_plane
    #  plane = Plane.new
    #   ema.planes << plane
     expect(ema.planes.length).to eq(1)
 end

# # Plane has state landed so cannot be landed again
#  it 'airport can only land planes which are mid air i.e. landed is false' do
#   ema = Airport.new
#   #USE land_plane WITH PARAMETER PASSING IN LANDED PLANE
#   ema.land_plane
#   expect(ema.land_plane).to raise_error(Runtimeerror)
# end
#More planes can be landed at that airport
  it 'airport logs more planes as being in airport on landing' do
   ema = Airport.new
   18.times {ema.land_plane}
  #  plane = Plane.new
  #   ema.planes << plane
   expect(ema.planes.length).to eq(18)
 end

 #More planes can take off from airport
 it 'airport can take off as many planes as are in the airport' do
   ema = Airport.new
   18.times {ema.land_plane}
   18.times {ema.takeoff_plane}
    expect(ema.planes.length).to eq(0)
  end
  #set the capacity of airport
  it 'system_admin can create airport default capacity and an airport with an override to set actual capacity' do
    ema = Airport.new
    pmi = Airport.new(200)
    expect(pmi.capacity).to eq(200)
    expect(ema.capacity).to eq(20)
  end

  #planes cannot land when capacity is reached

# Plane is in air so cannot take off

#weather is stormy so plane cannot land

#weather is stormy so plane cannot take off


end
