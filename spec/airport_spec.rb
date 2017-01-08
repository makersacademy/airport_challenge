require "airport"
describe Airport do

it {is_expected.to respond_to :land}
it {is_expected.to respond_to(:land).with(1).argument }
it "should send a message when landed" do
allow(subject).to receive(:stormy?) {false}
expect(subject.land(Plane.new)).to include("plane has landed")
end
it {is_expected.to respond_to :take_off}
it "should land and contain landed planes and confirm when planes have
taken off" do

airport = Airport.new
plane = Plane.new
allow(airport).to receive(:stormy?) {false}
airport.land(plane)
expect(airport.planes).to include(plane)
expect(airport.take_off(plane)).to include("plane has taken off")

end
it "should raise an error when landing and weather is stormy" do
  airport = Airport.new
  plane = Plane.new
  allow(airport).to receive(:stormy?) {true}
  expect{airport.land(plane)}.to raise_error "no landing possible due to weather conditions"
end
it "should raise an error when taking off and weather is stormy" do
  airport = Airport.new
  other_plane = Plane.new
  allow(airport).to receive(:stormy?) {false}
  airport.land(other_plane)
  allow(airport).to receive(:stormy?) {true}
  expect{airport.take_off(other_plane)}.to raise_error "no take off possible due to weather conditions"
end

it "should raise an error if max cap has been reached" do
allow(subject).to receive(:stormy?){false}
expect {(Airport::DEFAULT_CAPACITY).times{subject.land(Plane.new)}}.to raise_error "airport is full"

end
it "should define capacity in a constant" do
expect(Airport).to be_const_defined(:DEFAULT_CAPACITY)
end
it "should raise an error when a plane is asked to take_off that is not at this airport" do
airport = Airport.new
plane = Plane.new
allow(airport).to receive(:stormy?) {false}
expect{airport.take_off(plane)}.to raise_error "plane is not at this airport"
end
it "should raise an error when a plane is asked to land that has already landed" do
airport = Airport.new
plane = Plane.new
allow(airport).to receive(:stormy?) {false}
airport.land(plane)
expect{airport.land(plane)}.to raise_error "plane has already landed"
end
end
