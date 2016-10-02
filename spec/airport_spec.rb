require "airport"
require "plane"

describe Airport do
  airport = Airport.new
  it 'lands a plane' do
    expect(airport).to respond_to(:lands_plane).with(1).argument
  end

  it 'is landed' do
    plane = Plane.new
    expect(plane.landed?).to eq true
  end
end
