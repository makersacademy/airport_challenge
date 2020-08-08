require './docs/airport'
require './docs/plane'

describe Plane do
it 'makes an instance of a plane' do
    plane = Plane.new
    expect(plane).to be_instance_of(Plane)
    end
it 'checks whether a plane left the airport after departure' do
    plane = Plane.new
    expect(plane).to respond_to(:departed?)
    end
end