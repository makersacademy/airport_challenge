require 'plane'
require 'airport'

describe Plane do


  it 'responds to #plane_land' do
    plane = Plane.new
    subject.plane_land(plane)
    expect(subject.plane).to eq plane

  end

  it 'responds to #plane_take_off' do
    plane = Plane.new
    expect(subject).to respond_to(:plane_take_off)
  end


  it 'responds to #left_airport?' do
    plane = Plane.new
    expect(subject).to respond_to(:left_airport?)
  end




end
