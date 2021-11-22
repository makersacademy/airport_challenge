require './lib/airport.rb'
require './lib/plane.rb'

describe Plane do
# Checks that new Plane class instances can be made
  it 'can create new instances of the Plane class' do
    plane = Plane.new
    expect(plane).to be_a(Plane)
  end
end