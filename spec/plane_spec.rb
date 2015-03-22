require 'plane'

describe Plane do

  it 'has an airborne status when created' do
    plane = Plane.new
    expect(plane).to respond_to :airborne?
  end

  it 'can take off' do
    plane = Plane.new
    expect(plane.take_off).to be_airborne
  end

  it 'can land' do
    plane = Plane.new
    expect(plane.land).not_to be_airborne
  end

end
