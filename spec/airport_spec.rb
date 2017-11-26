require 'airport'

describe Airport do

  it "can have a plane land at it" do
    plane = double(:plane)
    expect(subject.land(plane)).to include plane
  end



end
