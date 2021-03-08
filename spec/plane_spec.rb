require 'plane'
require 'airport'
require 'air_traf_con'

describe Plane do

  plane = Plane.new("O'Hare")

  it 'has a location at an Airport that can be read and changed' do
    expect(plane.location).to eq("O'Hare")
  end

  it 'reports when it leaves an airport' do
    plane.takeoff
    expect(plane.location).to eq("Left O'Hare")
  end

  it 'has a status of flying that can be read and changed' do
    plane.flying = true
    expect(plane.flying).to be true
  end

  it 'cant take off if its already flying' do
    plane.flying = true
    expect(plane.takeoff).to be false
  end

  it 'cant land if its not flying' do
    plane.flying = false
    expect(plane.land).to be false
  end

end
