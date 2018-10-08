require 'airport'
require 'plane'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  it "Ground test to validate if Airport exist before allowing landing/take off" do
    expect(Airport.new).to be_a(Airport)
  end

  it "Land a plane" do
    weather = "sunny"
    plane = Plane.new
    expect(subject.land_plane(plane,weather)).to eq "Landed successfully"
  end

  it "Land planes beyond the default capacity of 10 planes given weather is 'sunny'" do
    weather = "sunny"
    expect{11.times{subject.land_plane(Plane.new,weather)}}.to raise_error("Airport out of capacity cannot land the plane")
  end

  it "Take off a plane" do
    weather = "sunny"
    airport = Airport.new
    airport.landedplanes_register[1] = Plane.new
    expect(airport.take_off(1,weather)).to eq "Departed successfully"
  end

  it "Cannot take-off a plane already in flight" do
    weather = "sunny"
    airport = Airport.new
    airport.landedplanes_register[1] = Plane.new
    airport.landedplanes_register[2] = Plane.new
    airport.take_off(1,weather)
    expect{airport.take_off(1,weather)}.to raise_error("Cannot take-off plane already in flight")
  end

end
