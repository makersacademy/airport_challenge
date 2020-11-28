require 'plane'

describe Plane do
  it 'can create an instance of plane' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end

  it 'can respond to land' do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end

  it 'can respond to take off' do
    plane = Plane.new
    expect(plane).to respond_to(:take_off)
  end
end
