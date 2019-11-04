require './lib/plane.rb'
describe Plane do
  it 'instructs a plane to take off from an airport' do
    plane = Plane.new
    expect(plane).to respond_to :plane_take_off
  end
end
