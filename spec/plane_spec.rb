require 'plane'

describe Plane do
  it 'creates an instance of Planes' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end
end
