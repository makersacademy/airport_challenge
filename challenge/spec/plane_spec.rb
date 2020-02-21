require 'Plane'

describe 'Plane' do
it 'can create an instance of class Plane' do
  plane = Plane.new
  expect(plane).to be_a Plane
end
end
