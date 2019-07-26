require "Airport"
require "Plane"


describe Airport do

  #attr_reader :weather


describe "#land(plane)" do

it "raises an error when landing attempted during a storm" do
  weather = double(:weather)
  allow(weather).to receive(:stormy?).and_return(true)
  airport = Airport.new(weather)
  plane = Plane.new


  expect { airport.land(plane) }.to raise_error "Too stormy to land"
  end

#   REDUNDANT? it "allows planes to land" do
#   plane = Plane.new
#   #weather = Weather.new
#   #allow(weather).to receive(:stormy?).and_return false
#   expect(subject.land(plane)).to eq plane
# end

it "raises an error when there is no room to land" do
  weather = double(:weather)
  allow(weather).to receive(:stormy?).and_return(false)
  plane = Plane.new
  airport = Airport.new(weather)
  airport.land(plane)

  #allow(weather).to receive(:stormy?).and_return false
  expect { airport.land(plane) }.to raise_error "No room to land"
end
end


describe "#takeoff" do

it "allows a plane to take off and confirm that its not at airport" do
  weather = double(:weather)
  allow(weather).to receive(:stormy?).and_return(false)
  plane = Plane.new
  airport = Airport.new(weather)
  airport.land(plane)

    #allow(weather).to receive(:OUTLOOK) {'ok'}
  #allow(weather).to receive(:stormy?).and_return false
  expect(airport.takeoff).to eq "Takeoff"
  #plane

end

it "raises an error when takeoff attempted during a storm" do
  weather = double(:weather)
allow(weather).to receive(:stormy?).and_return(true)

   airport = Airport.new(weather)
   plane = Plane.new

#problem here is that when i do airport.land(plane) then thats causing an error because you're landing a plane in a storm
# could you do a double in here like allow airport to be full? need to write full and empty methods but could work
   expect(airport.takeoff).to raise_error "Too stormy to takeoff"
 end


# it "raises an error when takeoff attempted during a storm" do
#   plane = Plane.new
#   weather = Weather.new
#   allow(weather).to receive(:stormy?).and_return false
#   expect { subject.takeoff }.to raise_error "Too stormy to takeoff"
# end

  it "raises an error when there are no airplanes to takeoff" do
  expect { subject.takeoff }.to raise_error "No planes available"
end
end
end








#
