require './lib/plane.rb'
require './lib/airport.rb'

describe Plane do
puts "--------PLANE STATUS----------"
it "checks that plane responds to status" do
expect(subject).to respond_to :status
end

puts "-------PLANE LANDING---------"
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

it "checks that the plane cannot land if already at airport" do
heathrow = Airport.new
subject.land(heathrow)
expect { subject.land(heathrow) }.to raise_error "Plane cannot land."
end

it "checks that the plane cannot land if at a different airport" do
  arlanda = Airport.new
  heathrow = Airport.new
  subject.land(arlanda)
  expect { subject.land(heathrow).to raise_error "Plane cannot land." }
end

#Options:
#1. Land: Cannot land if at airport already.
#2. Land: Cannot land if at a different airport.

puts "--------PLANE TAKE OFF---------"
it "checks that plane responds to takeoff" do
expect(subject).to respond_to :takeoff
end
it "checks that plane status has changed to flying" do
  heathrow = Airport.new
  subject.land(heathrow)
  expect(subject.takeoff(heathrow)).to eq "Flying"
end

#Options:
#1. Takeoff: Cannot takeoff if flying.
#2. Takeoff: Cannot takeoff if at another airport.

it "checks that planes cannot take off if flying" do
heathrow = Airport.new
subject.land(heathrow)
subject.takeoff(heathrow)
expect { subject.takeoff(heathrow) }.to raise_error "Cannot takeoff if not at correct airport."
end

it "checks that planes cannot takeoff if at another airport" do
  heathrow = Airport.new
  arlanda = Airport.new
  subject.land(heathrow)
  expect { subject.takeoff(arlanda) }.to raise_error "Cannot takeoff if not at correct airport."
end
end
