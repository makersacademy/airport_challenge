require 'plane'
require 'airport'
require 'weather_spec'

describe Plane do 

  let (:plane) {Plane.new}
  let (:airport) {Airport.new}

  it "should initialize with the plane not being airborn" do
    expect(plane.airborn).to eq(false)
  end


  it "shouldn't be airborn when in the hanger" do
    allow(airport).to receive(:stormy?).and_return(false)
    hanger = [plane]
    expect(plane.airborn).to be_falsey
  end

  it "should be airborn if it takes off successfully from the airport" do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
    airport.take_off(plane)
    expect(plane.airborn).to eq(true)
  end

  it { is_expected.to respond_to :landed }
  it { is_expected.to respond_to :in_the_air }

end