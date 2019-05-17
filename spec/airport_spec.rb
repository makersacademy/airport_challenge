require 'plane'

describe Plane do
  it 'creates a new instance of plane' do
    plane = Plane.new
    expect(plane).to be_an_instance_of(Plane)
  end
end
