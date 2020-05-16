require './lib/plane.rb'

describe Plane do
  it 'responds to #land' do
  plane = Plane.new
  expect(plane).to respond_to(:land)
  end
end