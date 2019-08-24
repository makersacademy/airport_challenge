require 'plane'

describe Plane do

  it 'can land' do
    plane = Plane.new
    plane.land
    expect(plane.is_flying).to eq false
  end

  it 'will not try to land if it is not flying' do
    plane = Plane.new
    plane.land
    expect { plane.land }.to raise_error "Plane already landed"
  end

end
