require './lib/plane.rb'
require './lib/airport.rb'

describe Plane do
describe "#Plane Status" do
it "checks that plane responds to status" do
expect(subject).to respond_to :status
end
end

describe "#Plane Landing" do
it "checks that plane responds to land method" do
expect(subject).to respond_to :land
end
it "checks that land method takes one argument" do
  expect(subject).to respond_to(:land).with(1).argument
end

it "checks that the plane status has changed to the airport where it has landed" do
heathrow = Airport.new
subject.land(heathrow) #Plane lands in new airport.
expect(subject.status).to eq heathrow #Status to change to that airport.
end
end

describe "#Plane Takeoff" do
it "checks that plane responds to takeoff method" do
expect(subject).to respond_to :takeoff
end
it "checks that plane status has changed to status to flying" do
  heathrow = Airport.new
  subject.land(heathrow)
  expect(subject.takeoff(heathrow)).to eq "Flying"
end
end

describe "#Status before Landing" do
it "checks that the plane cannot land if already at airport" do
heathrow = Airport.new
subject.land(heathrow)
expect { subject.land(heathrow) }.to raise_error "Plane can only land if status is set to flying."
end

it "checks that the plane cannot land if at a different airport" do
  arlanda = Airport.new
  heathrow = Airport.new
  subject.land(arlanda)
  expect { subject.land(heathrow).to raise_error "Plane can only land if status is set to flying." }
end
end

describe "#Status before Takeoff" do
it "checks that planes cannot take off if flying" do
heathrow = Airport.new
subject.land(heathrow)
subject.takeoff(heathrow)
expect { subject.takeoff(heathrow) }.to raise_error "Plane can only takeoff if it's located at the airport where it landed."
end

it "checks that planes cannot takeoff if at another airport" do
  heathrow = Airport.new
  arlanda = Airport.new
  subject.land(heathrow)
  expect { subject.takeoff(arlanda) }.to raise_error "Plane can only takeoff if it's located at the airport where it landed."
end
end
end

=begin

puts "-----WEATHER CHECK---------"
it "subject responds to weather_check?" do
  expect(subject).to respond_to :weather_check?
end
it "checks that weather_check? returns true or false" do
expect(subject.stub(:weather_check?)).to eq true
end
end

=end


#method = weather_check? Replace weather_check
#with code that returns a specified result.
