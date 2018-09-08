require 'plane'

describe Plane do
  xit "lands at an airport" do
    airport = Airport.new
    expect(subject.land_at(airport)).to eq(airport)
  end

  xit "takes off from airport" do
    expect(subject.take_off).to eq("In the air.")
  end

  it "wont take off in a storm" do
    expect(subject.take_off).to eq("Taking off is too dangerous")
  end

  it "wont land in a storm" do
    expect(subject.land_at(Airport.new)).to eq("Landing is too dangerous")
  end

  it "can't land at a full airport" do
    expect(subject.land_at(Airport.new)).to eq("Sorry, the hanger is full")
  end
end
