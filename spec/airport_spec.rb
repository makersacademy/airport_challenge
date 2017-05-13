require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  it "lands a flying plane" do
    plane = Plane.new(:flying)
    airport.land(plane)
    expect(plane.landed?).to eq true
  end

  it "does not land a landed plane" do
    plane = Plane.new(:landed)
    expect { airport.land(plane) }.to raise_error("Not this time buddy, you only land once!")
  end

  it "does not land a taken off plane" do
    plane = Plane.new(:taken_off)
    expect { airport.land(plane) }.to raise_error("Not this time buddy, you can't land a taken off plane!")
  end

  it "takes off a landed plane" do
    plane = Plane.new(:landed)
    airport.takeoff(plane)
    expect(plane.taken_off?).to eq true
  end

  it "does not take off a flying plane" do
    plane = Plane.new(:flying)
    expect { airport.takeoff(plane) }.to raise_error("Not this time buddy, you can't takeoff a flying plane!")
  end

  it "does not take off a taken off plane" do
    plane = Plane.new(:taken_off)
    expect { airport.takeoff(plane) }.to raise_error("Not this time buddy, you can't takeoff a taken off plane!")
  end

  it "knows flying planes are not present" do
    plane = Plane.new
    expect(airport.present?(plane)).to eq false
  end

  it "knows landed planes are present" do
    plane = Plane.new
    airport.land(plane)
    expect(airport.present?(plane)).to eq true
  end

  it "forgets planes that have taken off" do
    plane = Plane.new
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.present?(plane)).to eq false
  end

end
