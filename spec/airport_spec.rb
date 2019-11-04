require './lib/airport'
describe Airport do
  it 'recognises the existence of an Airport' do
    airport = Airport.new
  end
  it 'instruct a plane to land at an airport' do
    is_expected.to respond_to :plane_land
  end
  it 'instructs a plane to take off' do
    is_expected.to respond_to :plane_take_off
  end 
end
