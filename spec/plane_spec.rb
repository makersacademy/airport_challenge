require 'plane'

describe Plane do

  it "allows a plane to take off" do
    pl = Plane.new
    expect(pl).to respond_to(:take_off)
  end

  it "confirms it is no longer in the airport" do
    pl = Plane.new
    expect(pl.take_off).to eq "Departed"
  end
end
