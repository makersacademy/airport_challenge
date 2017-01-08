require './lib/Airport'
require './lib/Plane'

describe Airport do

    it 'responds to plane class method to take off' do
    expect(Airport.new).to respond_to :takeoff_plane
end
    it 'responds to plane class method to land' do
    expect(Airport.new).to respond_to :land_plane
end

   it 'logs that plane is not in airport after take off' do
     ema = Airport.new
     plane = Plane.new
     #set array with a landed plane
     ema.planes << plane
     ema.takeoff_plane
     expect(ema.planes.length).to eq(0)
end

  it 'logs the plane as being in airport on landing' do
     ema = Airport.new
     ema.land_plane
    #  plane = Plane.new
    #   ema.planes << plane
     expect(ema.planes.length).to eq(1)
 end

# # Plane has state landed so cannot be landed again
#  it 'can only land planes which are mid air i.e. landed is false' do
#   ema = Airport.new
#   #USE land_plane WITH PARAMETER PASSING IN LANDED PLANE
#   ema.land_plane
#   expect(ema.land_plane).to raise_error(Runtimeerror)
# end
#More planes can be landed at that airport
  it 'logs more planes as being in airport on landing' do
   ema = Airport.new
   3.times {ema.land_plane}
  #  plane = Plane.new
  #   ema.planes << plane
   expect(ema.planes.length).to eq(3)
 end

 #More planes can take off from airport
 it 'can take off as many planes as are in the airport' do
   ema = Airport.new
   3.times {ema.land_plane}
   3.times {ema.takeoff_plane}
    expect(ema.planes.length).to eq(0)
  end
  #set the capacity of airport
  it 'system_admin can create airport with an override to set actual capacity' do
    pmi = Airport.new(200)
    expect(pmi.capacity).to eq(200)
  end
  #docking station uses DEFAULT_CAPACITY
  it 'uses default when no capacity passed in' do
    bhx = Airport.new()
    expect(bhx.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  #planes cannot land when capacity is reached
  it 'raises an error when airport is full' do
      #plane = Plane.new .
      x = Airport::DEFAULT_CAPACITY+1
      expect {x.times {subject.land_plane}}.to raise_error 'Airport is full'
    end

# # Plane is in air so cannot take off
#   it 'raises an error if plane is already in air' do
#     plane = Plane.new
#     expect {subject.takeoff_plane}.to raise_error 'No plane on ground'
#   end
#weather is stormy so plane cannot land

#weather is stormy so plane cannot take off


end
