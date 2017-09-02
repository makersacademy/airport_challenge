require 'plane'
require 'weather'

describe Plane do
  # p described_class
  # subject(:airport) { described_class.new}

  it 'responds to #plane_land' do
    plane = Plane.new
    expect(subject).to respond_to(:plane_land)
  end

  it 'responds to #plane_take_off' do
    plane = Plane.new
    # we want to return the plane we land
    expect(subject.plane_land(plane)).to eq plane
    # expect(subject).to respond_to(:plane_take_off)
  end


  it 'responds to #left_airport?' do
    # we need to have the plane that just took off, not a new one!?
    expect(subject).to respond_to(:left_airport?)
  end

  # it 'responds to #weather_stormy' do
  #   expect(subject).to respond_to(:weather_stormy)
  # end


end
