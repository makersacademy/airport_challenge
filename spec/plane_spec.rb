require 'plane'
require 'airport'

describe Plane do

  let(:plane) {Plane.new}
  let(:airport) {Airport.new}


  it "can land" do
    airport = Airport.new
    expect(plane.land(airport)).to eq(:airport)
  end

  it "cannot land when not in flight" do
    airport = Airport.new
    expect(plane.land(airport)).to eq(Error) if @location == :airport
  end

  it "cannot take off when already in flight" do
    expect(plane.take_off).to eq(Error) if @location == :sky
  end

  it "can take off" do
    expect(plane.take_off).to eq(:sky)
  end

end
