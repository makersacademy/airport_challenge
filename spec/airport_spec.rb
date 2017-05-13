require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument  }

  it 'should allow plane to land at airport' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end

  it 'should only allow airborne planes to land' do
    plane = Plane.new
    subject.land_plane(plane)
    expect{subject.land_plane(plane)}.to raise_error{"Plane is already landed"}
  end

  it 'should confirm that plane has landed' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(plane.airborne?).to eq false 
  end

end
