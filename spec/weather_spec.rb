require 'weather'
require 'plane'
require 'airport'

describe Weather do

  it { expect(subject).to respond_to(:stormy?) }

  it "prevents landing if stormy" do
    airport1 = Airport.new
    plane1 = Plane.new
    expect { airport1.land(plane1) }.to raise_error "A storm is coming"
  end

  it "prevents taking off if stormy" do
    airport2 = Airport.new
    expect { airport2.take_off }.to raise_error "A storm is coming"
  end

end
