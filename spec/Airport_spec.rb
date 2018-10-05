require './lib/Airport.rb'
require './lib/Plane.rb'

describe Airport do
  it 'Should land a plane at the Airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'Should make a plane at the Airport take off and check its no longer there' do
    plane = Plane.new
    plane.land(plane)
    subject.take_off(plane)
  end
end
