require 'plane'

describe Plane do
  plane = Plane.new
  it 'checks plane is working' do
    expect(plane).to respond_to(:working?)
  end
end
