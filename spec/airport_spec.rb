require 'airport'

describe Airport do
  it "Lets a plane land" do
    airport = Airport.new
    expect(airport).to respond_to(:land).with(1).arguments
  end
end
