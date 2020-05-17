require 'airport'
require 'plane'

describe Airport do
  it 'Create an instance of the class Airport' do
    expect(Airport.new).to be_instance_of Airport
  end

end

describe Plane do
  it 'Create an instance of the class Plane' do
    expect(Plane.new).to be_instance_of Plane
  end

end
