require "airport.rb"

describe Airport do

let (:airport) {Airport.new}

  it "responds to land method" do
    expect(airport).to respond_to :land
  end

  it "can land a plane" do
    plane = Plane.new
    expect(airport.land(plane)).to eq plane
  end

end
