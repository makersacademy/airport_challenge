require 'airport'

describe Airport do
  it "should respond to the :land_plane method" do
    airport = Airport.new
    expect(airport).to respond_to(:land_plane)
  end
end
