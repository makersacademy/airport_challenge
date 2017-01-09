require './lib/Airport'
require './lib/Plane'

describe Airport do
       let(:sunny) { double :sunny}

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

#check for specific e.g. last plane - is it no longer in planes?
#expect({:a => 'b'}).to include(:a => 'b')
  it 'logs the plane as being in airport on landing' do
     ema = Airport.new
     ema.land_plane
    #  plane = Plane.new
    #   ema.planes << plane
     expect(ema.planes.length).to eq(1)
 end
#ADD THE DOUBLES
# # Plane has state landed so cannot be landed again
 # it 'can only land planes which are not already on ground' do
 #   ema = Airport.new
 #   error_plane = ema.land_plane
 #  expect{(ema.land_plane(error_plane))}.to raise_error 'Plane already on ground'
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

#
#   it 'weather is stormy so plane cannot land' do
#
#   allow(Airport).to receive(:sunny).and_return(false)
#   expect {subject.land_plane}.to raise_error 'Airport is closed due to stormy weather'
#   end
#
#   it 'weather is stormy so plane cannot take off' do
#
#   allow(Airport).to receive(:sunny).and_return(false)
#   expect {subject.takeoff_plane}.to raise_error 'Airport is closed due to stormy weather'
#   end
#
end

# # Plane is in air so cannot take off _ WOULD USE DOUBLE
#plane_to_take_off = Plane.new
#=> #<Plane:0x007f98b0963a98 @landed=false>
# plane_to_take_off.takeoff_plane
#   it 'raises an error if plane is already in air' do
#     plane = Plane.new
#     expect {subject.takeoff_plane}.to raise_error 'No plane on ground'
#   end
