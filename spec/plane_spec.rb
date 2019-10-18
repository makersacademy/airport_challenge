require 'plane'

describe Plane do

  it 'an instance of plane can respond to the method destination' do
    plane = Plane.new
    expect(plane).to respond_to(:destination)
  end

end
