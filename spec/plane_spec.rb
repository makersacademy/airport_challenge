require './lib/plane.rb'

# checks tells plane lands at airport
describe Plane do
  it "tells plane to land at airport" do
    plane = Plane.new
    expect(plane.land_plane). to eq "land"

  end



# instruct plane to take off

  it "can instruct plane to take off" do
    plane = Plane.new
  expect(plane.take_off_plane).to eq 'take off'

  end

# check if plane has left airport
  it 'checks if plane has left the airport' do
    plane = Plane.new
  expect(plane.has_plane_left?).to eq (true)

end

# check from airport if safe to land
  it "can check with airport to see if they are at full capacity when landing" do
    airport = Airport.new
    expect(airport).to respond_to(:full_capacity?)
  end



end