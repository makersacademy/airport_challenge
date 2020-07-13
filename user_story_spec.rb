require 'airport'

describe User_story do
    
# #     As an air traffic controller 
# #     So I can get passengers to a destination 
 it 'instruct a plane to land at an airport' do
      plane = Plane.new
      airport = Airport.new(40)
     expect { airport.land(plane) }.not_to raise_error
 end

# # As an air traffic controller 
# # So I can get passengers on the way to their destination 
 it 'instruct a plane to take off from an airport and no longer in the airport' do
       plane = Plane.new
       airport = Airport.new(40)
     expect { airport.take_off(plane) }.not_to raise_error
 end

# # As an air traffic controller 
# # To ensure safety 
 it 'does_not land when airport full' do
     plane = Plane.new
     airport = Airport.new(40) #fixed capacity
     40.times { airport.land(plane) } # land so the capacity is filled
    expect { airport.land(plane) }.to raise_error "this airport is full"
  end

  it "does noy not allow planes to land when stormy" do
    airport = Airport.new(40)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.lannd(plane)) }.to raise_error "stormy weather, cannot land"
  end
# end