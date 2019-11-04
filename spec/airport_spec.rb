require 'airport'
describe Airport do

  it {is_expected.to be_kind_of(Airport)}

  # it 'can create and instance of an airport' do
  #   airport = Airport.new
  #   expect(airport).to be_kind_of(Airport)
  # end

  it {is_expected.to respond_to(:land_plane)}

  # it 'can respond to land_plane' do
  #   airport = Airport.new
  #   expect(airport).to respond_to(:land_plane)
  # end

end
