require 'plane'

describe Plane do

  it "should be able to land at a specific airport" do
    airport = double(:airport)
    subject.land(airport)
    expect(subject.status).to eq airport
  end

  it "should be able to take off from anywhere" do
    airport = double(:airport)
    subject.land(airport)
    subject.takeoff
    expect(subject.status).to eq "In the air"
  end

end
