require 'plane'

describe Plane do
  it 'instantiates a plane class' do
    plane = Plane.new
    expect(plane).to be_a_kind_of Plane
  end
end
