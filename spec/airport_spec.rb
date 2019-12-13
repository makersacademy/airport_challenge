require 'airport.rb'

describe Airport do
  it 'can respond to message land_plane' do
    expect(Airport.new).to respond_to(:land_plane)
  end

end

#instance of class