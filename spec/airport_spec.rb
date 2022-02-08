require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:plane_takeoff).with(1).argument }
  it { is_expected.to respond_to(:planes_available) }
  
  it 'can land a plane' do
    plane = Plane.new
       # ATC want to land the plane at the airport
    expect(subject.land_plane(plane)).to eq (1)
  end

  it 'can let a plane take off' do
    plane = Plane.new
    subject.land_plane("747")
    subject.land_plane("concorde")
     # ATC wants plane to take off / leave airport
    expect(subject.plane_takeoff("747")).to eq (1)
  end

  it 'can confirm if planes at airport' do
    plane = Plane.new
    subject.land_plane("747")
    subject.land_plane("concorde")
    subject.plane_takeoff("747")
    # ATC wants to know plane left airport
    expect(subject.planes_available).to eq (1)
  end

  describe '#land_plane' do
    # ATC wants to refuse landing if airport full
    it 'refuse landing if airport full' do
      subject.land_plane("747")
      subject.land_plane("concorde")
      subject.land_plane("xwing")
      subject.land_plane("falcon")
      expect { subject.land_plane("bigboy") }.to raise_error ("The Hanger is full you cannot land")
    end
  end

end
