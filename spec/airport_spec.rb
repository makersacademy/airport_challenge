require 'airport'
require 'plane'

describe Airport do
  it 'creates an instance of the class Airport' do
    expect(subject).to be_instance_of Airport
  end
  it 'creates an array for storing planes' do
    expect(subject.instance_variable_get :@planes_in)
  end
  it 'allows a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it 'stores a plane when landed' do
    plane = Plane.new
    expect(subject.land(plane)).to match_array([plane])
  end
end
