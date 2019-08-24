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

  it 'can take off' do
    plane = Plane.new
    plane.land
    plane.take_off
    expect(plane.is_flying).to eq true
  end

  it 'will not take off if not already flying' do
    plane = Plane.new
    expect { plane.take_off }.to raise_error "Plane is already flying"
  end

end
