require './lib/plane.rb'

describe Plane do

  it 'expects plane to be an instance of the plane class' do
    plane = Plane.new
    expect(plane).to be_instance_of(Plane)
  end
end
