# User Stories:
# *I want to instruct a plane to land at an airport
# *I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport
# *I want to prevent landing when the airport is full

require 'airport'

describe Airport.new do

  it 'creates an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it 'lands a plane' do
    airport = Airport.new
    expect(airport).to respond_to(:land_plane).with(1).argument
  end

  it 'releases plane for take off' do
    airport = Airport.new
    expect(airport).to respond_to(:plane_take_off)
  end

  it 'counts planes on ground' do
    airport = Airport.new
    expect(land_plane).to change(plane.count).by(1)
  end

  # it { is_expected.to respond_to(:plane) }

end
