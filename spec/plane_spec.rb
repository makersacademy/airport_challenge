require 'plane'

describe Plane do

  it { is_expected.to respond_to :landed }

  it "updates its location when it has landed" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(plane.landed).to eq true
  end

  it { is_expected.to respond_to :taken_off }

  it "updates its location when it has taken off" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(plane.taken_off).to eq false
  end

end
