require 'airport'
require 'plane'

describe Airport do
  let (:boeing) {Plane.new}
  let (:heathrow) {Airport.new}

  it "#planes shows you what planes are at the airport" do
    boeing.land(heathrow)
    expect(heathrow.landed_planes).to include(boeing)
    boeing.take_off
    expect(heathrow.landed_planes).not_to include(boeing)
  end

  it "will be #initilized with weather" do
    expect(subject).to respond_to(:new).with(1).argument
  end

  it "checks weather and prevents #take_off and #landing if stormy" do

  end

end
