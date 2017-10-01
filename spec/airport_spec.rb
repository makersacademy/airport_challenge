require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {Airport.new}

  it { is_expected.to respond_to :plane_takeoff }

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  it 'lands the plane at the Airport' do
    plane = Plane.new
    expect(airport.land_plane(plane)).to eq plane
  end

  it { is_expected.to respond_to(:confirm_takeoff).with(1).argument }

  it 'confirms when plane has taken off' do
    plane = Plane.new
    expect(airport.confirm_takeoff(plane)).to eq "#{plane.to_s} has now taken off"
  end


end
