require './lib/airport.rb'

describe Airport do
describe "#Land Plane" do
  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to(:land).with(1).argument }

  it "checks that land method returns new status landed" do
  plane1 = Plane.new
  expect(subject.land(plane1)).to eq [plane1]
end
end

describe "#Landed?" do
  it { is_expected.to respond_to :landed?}
  it { is_expected.to respond_to(:landed?).with(1).argument }

it "checks that landed? method returns true if plane is stored in instance variable airplanes" do
  plane1 = Plane.new
  subject.land(plane1)
  expect(subject.landed?(plane1)).to eq true
end
end

describe "#Takeoff" do
it { is_expected.to respond_to :takeoff}
it { is_expected.to respond_to(:takeoff).with(1).argument }

end

describe "#Land Status?" do
it "checks that plane cannot land if already at airport" do
plane1 = Plane.new
subject.land(plane1)
expect {subject.land(plane1)}.to raise_error "Plane already in airport."
end
end

describe "#Takeoff Status?" do
it "checks that plane cannot takeoff if not in airport" do
plane1 = Plane.new
expect {subject.takeoff(plane1)}.to raise_error "Plane cannot takeoff if not landed in airport."
end
end
end


#Plane cannot land in a different airport.
#Plane cannot takeoff if in a different airport.
