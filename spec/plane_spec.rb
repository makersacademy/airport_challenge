require 'plane'

describe Plane do
  subject(:plane) { Plane.new }

  it 'plane lands at airport' do
    subject.land(airport)
    expect(airport.hangar.length).to be(1)
  end
end