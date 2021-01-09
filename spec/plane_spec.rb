require 'plane'
require 'airport'

describe Plane do
  it { is_expected.to respond_to(:plane) }

  # it 'will tell me if the plane has landed and at which airport' do
  #   plane = Plane.new
  #   airport = Airport.new
  #   airport.land(plane)
  #   expect(subject.landed).to eq "#{plane} has landed at #{airport}"
  # end
end
