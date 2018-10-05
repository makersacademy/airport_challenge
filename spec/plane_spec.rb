require "./lib/plane.rb"

describe Plane do

  let (:airport) {double :airport}

  it "lands at the specified airport" do
    allow(airport).to receive(:addtraffic).and_return(true)
    weather = ["sunny","stormy"].sample
    if weather == "sunny"
      expect(subject.land(airport,weather)).to eq(true)
    elsif weather == "stormy"
      expect{subject.land(airport,weather)}.to raise_error("Bad weather; no landing")
    end
  end

  it "takes off from at airport towards speficified destination" do
    allow(airport).to receive(:reducetraffic).and_return(true)
    weather = ["sunny","stormy"].sample
    if weather == "sunny"
      expect(subject.takeoff(airport,weather)).to eq(true)
    elsif weather == "stormy"
      expect{subject.takeoff(airport,weather)}.to raise_error("Bad weather; no takeoff")
    end
  end

end
