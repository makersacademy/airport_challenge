require './lib/plane.rb'
require './lib/airport.rb'

describe Plane do
describe "#Plane Status" do
it { is_expected.to respond_to :status}
end

describe "#Plane Landing" do
it { is_expected.to respond_to :land }
it { is_expected.to respond_to(:land).with(1).argument }

it "checks that the plane status has changed to the airport where it has landed" do
heathrow = double(:airport)
allow(subject).to receive(:weather_check?).and_return(true)
subject.land(heathrow) #Plane lands in new airport.
expect(subject.status).to eq heathrow #Status to change to that airport.
end
end

describe "#Plane Takeoff" do
  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to(:takeoff).with(1).argument }

it "checks that plane status has changed to status to flying" do
  heathrow = double(:airport)
  allow(subject).to receive(:weather_check?).and_return(true)
  subject.land(heathrow)
  expect(subject.takeoff(heathrow)).to eq "Flying"
end
end

describe "#Status before Landing" do
it "checks that the plane cannot land if already at airport" do
heathrow = double(:airport) #Set a new airport heathrow.
allow(subject).to receive(:weather_check?) {true} #Allow weather to be true.
subject.land(heathrow) #Land at heathrow.
expect {subject.land(heathrow)}.to raise_error "Plane can only land if status is set to flying."
end


it "checks that the plane cannot land if at a different airport" do
  arlanda = double(:airport) #New airport arlanda.
  heathrow = double(:airport) #New airport heathrow.
  allow(subject).to receive(:weather_check?) {true} #Allow weather to be true.
  subject.land(arlanda) #Land at Arlanda.
  expect {subject.land(heathrow)}.to raise_error "Plane can only land if status is set to flying."
end #Attempt to land at Heathrow, but fail.

it "checks that plane cannot land if weather is stormy" do
heathrow = double(:airport)
allow(subject).to receive(:land_status?) {true}
allow(subject).to receive(:weather_check?) {false}
expect{subject.land(heathrow)}.to raise_error "Plane cannot land due to stormy weather."
end
end

describe "#Status before Takeoff" do
it "checks that planes cannot take off if flying" do
heathrow = double(:airport)
allow(subject).to receive(:weather_check?) {true}
subject.land(heathrow)
subject.takeoff(heathrow)
expect {subject.takeoff(heathrow)}.to raise_error "Plane can only takeoff if it's located at the airport where it landed."
end

it "checks that planes cannot takeoff if at another airport" do
  heathrow = double(:airport) #Creates an airport heathrow.
  arlanda = double(:airport) #Creates another airport arlanda.
  allow(subject).to receive(:weather_check?) {true} #Allow test to receive true for weather check.
  subject.land(heathrow) #Lands plane at heathrow.
  expect {subject.takeoff(arlanda)}.to raise_error "Plane can only takeoff if it's located at the airport where it landed."
end #If tries to land at arlanda, raise error.

it "checks that plane cannot land if weather is stormy" do
heathrow = double(:airport)
allow(subject).to receive(:takeoff_status?) {true}
allow(subject).to receive(:weather_check?) {false}
expect{subject.takeoff(heathrow)}.to raise_error "Plane cannot takeoff due to stormy weather."
end
end
end
