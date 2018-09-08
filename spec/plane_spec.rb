require 'plane'

describe Plane do
  xit "lands at an airport" do
    airport = Airport.new
    expect(subject.land_at(airport)).to eq(airport)
  end

  xit "takes off from airport" do
    expect(subject.take_off).to eq("In the air.")
  end

  xit "wont take off in a storm" do
    expect(subject.take_off).to eq("Taking off is too dangerous")
  end

  xit "wont land in a storm" do
    expect(subject.land_at(Airport.new)).to eq("Landing is too dangerous")
  end

  xit "can't land at a full airport" do
    expect(subject.land_at(Airport.new)).to eq("Sorry, the hanger is full")
  end

  it "can only land if in the air (edge case)" do
    subject.land_at(Airport.new)
    expect(subject.land_at(Airport.new)).to eq("You are already, on the ground")
  end
end
