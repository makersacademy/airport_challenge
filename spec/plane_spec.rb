require 'plane'

describe Plane do
  it "lands at an airport" do
    airport = Airport.new
    expect(subject.land_at(airport)).to eq(airport)
  end

  it "takes off from airport" do
    expect(subject.take_off).to eq("In the air.")
  end

  xit "wont take off in a storm" do
    expect { subject.take_off }.to eq("Take off too dangerous")
  end

  it "wont land in a storm" do
    expect { subject.land_at(Airport.new) }.to eq("Landing is to dangerous")
  end
end
