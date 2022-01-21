require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:plane_takeoff).with(1).argument }
  it { is_expected.to respond_to(:planes_available) }
  
  it 'can land a plane' do
    plane = Plane.new
    subject.land_plane(plane)
      # ATC want to land the plane at the airport
    expect(subject.land_plane(plane)).to eq (1)
  end

  it 'can let a plane take off' do
    plane = Plane.new
    @planes_in_hanger = 2
    subject.plane_takeoff(plane)
    # ATC wants plane to take off / leave airport
    expect(subject.plane_takeoff(plane)).to eq (1)
  end

  it 'can confirm if planes at airport' do
    plane =Plane.new
    subject.land_plane(1)
    subject.land_plane(1)
    subject.plane_takeoff(1)
    # ATC wants to know plane left airport
    expect(subject.planes_available).to eq (1)
  end
end
