require './lib/plane'
describe Plane do
  it 'can land at the airport' do
  plane = Plane.new
  plane.land
  expect(plane).to respond_to(:land)
  end
end

describe Plane do
  it 'can take off from the airport' do
    plane=Plane.new
    plane.land
    plane.takeoff
    expect(plane).to respond_to(:takeoff)
  end
end
