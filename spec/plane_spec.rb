require 'plane'
require 'airport'

describe Plane do
  # p described_class
  # subject(:plane) { described_class.new}

  it 'responds to #plane_land' do
    plane = Plane.new
    subject.plane_land(plane)
    expect(subject.plane).to eq plane
    # expect(subject).to respond_to(:plane_land)
  end

  it 'responds to #plane_take_off' do
    plane = Plane.new
    # we want to return the plane we land
    # expect(subject.plane_land(plane)).to eq plane
    expect(subject).to respond_to(:plane_take_off)
  end


  it 'responds to #left_airport?' do
    plane = Plane.new
    # we need to have the plane that just took off, not a new one!?
    expect(subject).to respond_to(:left_airport?)
  end


  # describe 'plane_land' do
  #   it 'raises and error when the airport is full' do
  #     expect { subject.plane_land}.to raise_error 'airport is full'
  #   end
  # end

  # it 'responds to #weather_stormy' do
  #   expect(subject).to respond_to(:weather_stormy)
  # end


end
