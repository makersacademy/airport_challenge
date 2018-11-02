require 'airport'
require 'plane'

describe Airport do
  it 'should land a plane' do
    airbus = Plane.new
    expect(subject.land(airbus)).to eq airbus
  end
end
