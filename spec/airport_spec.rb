require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :land_plane }

  it "Plane lands into airport when sunny" do
    plane = double(:plane, weather: "sunny")
    subject.land_plane(plane)
    expect(subject.planes).to eq [plane]
  end

  it "If plane landed and sunny, can take off" do
    landed_plane = subject.land_plane(double(:plane, weather: "sunny"))
    expect(landed_plane.take_off).to eq flying
  end

  it "Landed planes cannot land" do
    landed_plane = subject.land_plane(double(:plane))
    expect { subject.land_plane(landed_plane) }.to raise_error "Plane already landed"
  end

  it "If airport capacity full- cannot land plane" do
    subject.capacity.times { subject.land_plane(double(:plane)) }
    expect { subject.land_plane(double(:plane)) }.to raise_error "No room at aiport"
  end

  it "If no planes in airport - cannot take off" do
    expect { subject.take_off }.to raise_error "No planes to take off"
  end

  it "Planes cannot take off if weather is stormy" do
    landed_plane = subject.land_plane(double(:plane, weather: "stormy"))
    expect { landed_plane.take_off }.to raise_error "Cannot fly in stormy weather"
  end

  it "Planes cannot land if weather is stormy" do
    expect { subject.land_plane(double(:plane, weather: "stormy")) }.to raise_error "Cannot land in stormy weather"
  end
end
