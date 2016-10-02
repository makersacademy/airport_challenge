require 'airport'

describe Airport do
airport = Airport.new
  it 'lands plane' do
    expect(airport).to respond_to (:land_plane)
  end
end
