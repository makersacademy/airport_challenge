require 'plane'


describe Plane do

  it 'can be reported to be flying' do
    subject.take_off
    expect(subject).to be_flying
  end

  it 'is at an airport' do
    expect(subject).to respond_to(:at_airport).with(1).argument
  end

describe "#at_airport" do

context "when plane has landed at the airport" do
  it "is at this airport" do
    airport = Airport.new
    p airport
    p subject
    expect(subject.at_airport(airport)).to eq(airport)
  end
end

describe "#flying?" do

context "when plane is flying" do
it "is not at an airport" do
  plane = Plane.new
  plane.flying?
  expect(plane.airport).to eq(nil)
end
end

end

end
end
