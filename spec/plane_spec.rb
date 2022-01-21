require './lib/plane.rb'

# checks tells plane lands at airport
describe Plane do
  it "tells plane to land at airport" do
    plane = Plane.new
    expect(plane.land_plane). to eq "land"

  end



# instruct plane to take off
  it "can instruct plane to take off"
  expect(plane.take_off_plane).to eq 'take off'

  end

# # check if plane has left airport
#   it 'checks if plane is still in airport'

# end



end