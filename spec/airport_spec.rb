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

  it "checks if a plane is in the airport" do
    plane = Plane.new(:landed)
    expect(airport.status(plane)).to eq "The plane is in the airport"
    plane = Plane.new(:taken_off)
    expect(airport.status(plane)).to eq "The plane is no longer in the airport"
    plane = Plane.new(:flying)
    expect(airport.status(plane)).to eq "The plane is no longer in the airport"
  end

end

# subject(:airport) { Airport.new }
# let(:plane) { double :plane }
# it { is_expected.to respond_to :land }
# it { is_expected.to respond_to :takeoff }
#
# it "lands a plane" do
#
#   allow(plane).to receive(:landed?).and_return(true)
#   airport.land(plane)
#   expect(plane.landed?).to eq true
# end
#
# it "takes off a plane" do
#   allow(plane).to receive(:taken_off?).and_return(true)
#   airport.takeoff(plane)
#   expect(plane.taken_off?).to eq true
# end
