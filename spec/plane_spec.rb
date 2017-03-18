require './lib/plane.rb'
require './lib/airport.rb'

describe Plane do
puts "--------PLANE STATUS----------"
it "checks that plane responds to status" do
expect(subject).to respond_to :status
end

puts "-------LAND THE PLANE---------"
it "checks that plane responds to land" do
expect(subject).to respond_to :land
end
it "checks that land takes one argument" do
  expect(subject).to respond_to(:land).with(1).argument
end
it "checks that the plane status has changed to the airport where it has landed" do
heathrow = Airport.new
subject.land(heathrow)
expect(subject.status).to eq heathrow
end

puts "--------PLANE TAKE OFF-----------"
it "checks that plane responds to take_off" do
expect(subject).to respond_to :takeoff
end
it "checks that plane status has changed to flying" do
  expect(subject.takeoff).to eq "Flying"
end
=begin
it "checks that planes cannot land if they are already in the airport" do
heathrow = Airport.new
subject.land(heathrow)
expect(subject.land(heathrow)).to raise_error "Plane already in the airport!"
end
=end
end
