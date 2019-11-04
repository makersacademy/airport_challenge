require 'plane'

describe Plane do
  it 'creates an instance of plane' do
    plane = Plane.new
    expect(plane).to be_instance_of(Plane)
  end
end
