require 'plane'

describe Plane do
  it 'expect plane to be a kind of Plane' do
    plane = Plane.new
    expect(plane).to be_a_kind_of(Plane)
  end
  it 'expect plane to be working' do
    plane = Plane.new
    expect(plane).to respond_to(:working?)
  end
end
