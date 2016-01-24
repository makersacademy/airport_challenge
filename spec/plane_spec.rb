require 'plane'

describe Plane do
  it 'lands at an airport and confirms it has landed' do
    plane = Plane.new
    plane.land_at
    is_expected.to be_landed
  end
end