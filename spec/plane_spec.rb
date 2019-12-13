require './lib/airport'

describe Plane do
  it 'creates an instance of Plane class' do
    plane = Plane.new
    expect(plane). to be_instance_of Plane
  end
end
