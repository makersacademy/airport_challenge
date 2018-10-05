require "./lib/plane.rb"

describe "Plane" do

  let (:airport) {double :airport}

  before(:each) do
    @plane = Plane.new
  end

  it "lands at the specified airport" do
    allow(airport).to receive(:addtraffic).and_return(true)
    expect(@plane.land(airport)).to eq(true)
  end

  it "takes off from at airport towards speficified destination" do
    allow(airport).to receive(:reducetraffic).and_return(true)
    expect(@plane.takeoff(airport)).to eq(true)
  end

end
