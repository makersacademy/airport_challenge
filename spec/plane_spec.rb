require './lib/plane.rb'

describe Plane do
  it 'responds to #land' do
  plane = Plane.new
  expect(plane).to respond_to(:land).with(1).argument
  end

  it 'lands at an airport' do
  plane = Plane.new
  airport = Airport.new
  expect(plane.land(airport)).to eq airport
  end

end