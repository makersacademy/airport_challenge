require 'plane'

describe Plane do
  it 'lands at an airport and confirms it has landed' do
    plane = Plane.new
    plane.land
    expect(plane).to be_landed
  end

  it 'takes off from an airport and confirms it is no longer landed' do
    plane = Plane.new
    plane.take_off
    expect(plane).not_to be_landed
  end
end