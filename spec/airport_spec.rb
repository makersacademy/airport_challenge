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
    if weather == "sunny"
      plane = Plane.new
      expect(subject.land_plane(plane,weather)).to eq "Landed successfully"
    else
      expect{subject.land_plane(plane,weather)}.to raise_error("Bad Weather")
    end
  end

  it "Take off a plane" do
    weather = "sunny"
    if weather == "sunny"
      plane = Plane.new
       expect(subject.take_off(plane,weather)).to eq "Took off successfully"
    else
       expect{subject.take_off(plane,weather)}.to raise_error("Bad Weather")
    end
  end

end
