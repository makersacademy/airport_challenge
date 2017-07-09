require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }

  it 'allows a plane to land' do
    plane = Plane.new
    expect(airport.land(plane)).to eq [plane]
  end

end
