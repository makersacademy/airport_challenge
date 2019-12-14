require "Airport.rb"

describe Airport do

  it 'lands plane' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end

  it 'plane takes off' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq plane
  end

end






