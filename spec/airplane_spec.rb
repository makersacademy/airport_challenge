require 'airplane'

describe AirPlane do
  it { is_expected.to respond_to(:goes_in_air) }
  it "initializes with inair being false" do
    expect(AirPlane.new.inair).to eq false
  end
  it "returns error message when tries to land when not in air" do
    expect(AirPlane.new.land(AirPort.new)).to eq "cannot land because plane not in air"

  end
  it "returns error message when tries to land in stormy weather" do
    airplane = AirPlane.new
    airplane.goes_in_air
    allow(airplane).to receive(:chance).and_return(0)
    expect(airplane.land(AirPort.new)).to eq "stormy weather, cannot land"
  end
  it "returns error message when tries to land in a non-airport" do
    ap = AirPlane.new
    ap.goes_in_air
    expect(ap.land(Object.new)).to eq "can only land at airport"
  end
  it "returns error message when tries to land at full airport" do
    airport = AirPort.new(1)
    ap = AirPlane.new
    airport.dock(ap)
    airplane = AirPlane.new
    airplane.goes_in_air
    allow(airplane).to receive(:chance).and_return(1)
    expect(airplane.land(airport)).to eq "airport full, cannot land"
  end
  it "is added to airport array when it lands" do
    airplane = AirPlane.new
    airport = AirPort.new
    airplane.goes_in_air
    allow(airplane).to receive(:chance).and_return(1)
    airplane.land(airport)
    expect(airport.planes).to eq [airplane]

  end
  it "it's inair attribute becomes false when it lands" do
    airplane = AirPlane.new
    airport = AirPort.new
    airplane.goes_in_air
    allow(airplane).to receive(:chance).and_return(1)
    airplane.land(airport)
    expect(airplane.inair).to eq false
  end
  it "goes_in_air sets inair to true" do
    ap = AirPlane.new
    ap.goes_in_air
    expect(ap.inair).to eq true
  end

end
