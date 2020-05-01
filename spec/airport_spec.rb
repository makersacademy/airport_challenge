require "airport"


describe Airport do

describe "#landing" do
  it "allows plane to land at the airport" do
    plane = Plane.new
   expect(subject.landing(plane)).to eq([plane])
  end
end
describe '#takeoff' do
  it 'instructs a plane to take off and confirms its no longer at airport' do
   expect(subject.takeoff).to eq("The plane instructed has now left the airport")
end
end
end
