require './lib/plane.rb'
describe Plane do
  it 'confirms plane has left the airport' do
    plane = Plane.new
    expect(plane).to respond_to :confirm_plane_left
  end
end
