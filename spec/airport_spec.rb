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
end
