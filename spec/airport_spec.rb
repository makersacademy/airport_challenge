require 'airport'
require 'plane'

describe Airport do

  it "allows a plane to land at the airport" do
    ap = Airport.new
    expect(ap).to respond_to(:land)
  end
end
