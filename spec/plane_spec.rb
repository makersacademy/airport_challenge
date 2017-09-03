require 'plane'
require 'airport'
require 'weather'

describe Plane do

  # it { is_expected.to respond_to(:land).with(1).argument }

  it 'responds to #land' do
    plane = Plane.new
    # subject.land(plane)
    expect(plane).to respond_to(:land)
  end

  # it 'responds to #take_off' do
  #   expect(plane.flying).to eq true
  # end

  # it 'responds to #land' do
  #   expect(plane.flying).to eq false
  # end


  it 'responds to #take_off' do
    plane = Plane.new
    expect(plane).to respond_to(:take_off)
  end


  it 'responds to #left_airport?' do
    plane = Plane.new
    expect(plane).to respond_to(:left_airport?)
  end

end
