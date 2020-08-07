#As an air traffic controller
#So I can get passengers to a destination
#I want to instruct a plane to land at an airport
require 'airport'

describe Airport do
  it "Expects to see planes at airport" do
    plane = 1
    expect(subject.land(plane)).to eq nil
  end

  it "Expects planes to land at airport" do
    expect(subject.land(plane)).to eq [plane]
  end

end
