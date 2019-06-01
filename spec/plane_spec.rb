require 'plane'

describe Plane do
  it 'accepts a request to land at an airport' do
    airport = Airport.new
    expect(subject.land_at(airport)).to equal(true)
  end
end