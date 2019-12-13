require 'airport.rb'

describe Airport do
 it 'expects a class which creates instances' do
   expect(Airport.new).to be_a(Airport)
 end

  it 'can respond to message land_plane' do
    expect(Airport.new).to respond_to(:land_plane)
  end

end
