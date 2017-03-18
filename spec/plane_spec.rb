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
end
