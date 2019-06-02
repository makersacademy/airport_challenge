require 'plane'

describe Plane do
  it 'lands at airport' do
    plane = Plane.new
    expect(plane.land).to be_a Plane
  end
end
