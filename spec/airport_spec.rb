require './lib/airport'
require './lib/weather_check'

describe Airport do
describe "#Land Plane" do
  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to(:land).with(1).argument }

  it "checks that land method returns new status landed" do
  plane1 = Plane.new
  allow(subject).to receive(:full?) {false}
  allow(subject).to receive(:ready_to_land?) {false}
  allow(subject).to receive(:weather?) {false}
  expect(subject.land(plane1)).to eq [plane1]
end
end

describe "#Landed?" do
  it { is_expected.to respond_to :landed?}
  it { is_expected.to respond_to(:landed?).with(1).argument }


it "checks that landed? method returns true if plane is stored in instance variable airplanes" do
  plane1 = Plane.new
  allow(subject).to receive(:ready_to_land?) {false}
  allow(subject).to receive(:weather?) {false}
  subject.land(plane1)
  expect(subject.landed?(plane1)).to eq true
end
end

describe "#Takeoff" do
it { is_expected.to respond_to :takeoff}
it { is_expected.to respond_to(:takeoff).with(1).argument }
end


describe "#Ready_to_land?" do
it "checks that plane cannot land if already at airport" do
plane1 = Plane.new
allow(subject).to receive(:weather?) {false}
allow(subject).to receive(:full?) {false}
subject.land(plane1)
expect {subject.land(plane1)}.to raise_error "Plane can only land when flying."
end

it "checks that plane cannot land if weather is stormy" do
  plane1 = Plane.new
  allow(subject).to receive(:full?) {false}
  allow(subject).to receive(:ready_to_land?) {false}
  allow(subject).to receive(:weather?) {true}
  expect {subject.land(plane1)}.to raise_error "Plane cannot land due to stormy weather."
end
end


describe "#Ready to Takeoff?" do
it "checks that plane cannot takeoff if not in airport" do
plane1 = Plane.new
allow(subject).to receive(:weather?) {false}
expect {subject.takeoff(plane1)}.to raise_error "Plane cannot takeoff if not landed in airport."
end

it "checks that plane cannot takeoff if weather is stormy" do
  plane1 = Plane.new
  allow(subject).to receive(:ready_to_takeoff?) {true}
  allow(subject).to receive(:weather?) {true}
  expect {subject.takeoff(plane1)}.to raise_error "Plane cannot takeoff due to stormy weather."
end
end

describe "#Capacity" do
it "creates airport with a default capacity of 5 planes" do
expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
end


it "checks that plane cannot land if airport is full" do
plane1 = Plane.new
allow(subject).to receive(:full?) {true}
allow(subject).to receive(:ready_to_land?) {false}
allow(subject).to receive(:weather?) {false}
expect {subject.land(plane1)}.to raise_error "There is no available space in this airport."
end

it "allows engineers to rewrite capacity" do
  n = rand(0..50)
  subject.capacity = n
  expect(subject.capacity).to eq n
end
end
end

#Plane cannot land in a different airport. Create airport?
#Plane cannot takeoff if in a different airport.
