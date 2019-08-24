require 'plane'

describe Plane do

  it 'can land' do
    plane = Plane.new
    plane.land
    expect(plane.is_flying).to eq false
  end
end
