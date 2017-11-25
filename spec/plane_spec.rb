require 'airport'
require 'plane'

describe Plane do
  it 'has landed at the airport' do
    plane = Plane.new
    plane.landing
    expect(plane.flying).to eq false
  end


end
