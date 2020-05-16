require 'airport'
require 'plane'

describe Airport do
ap = Airport.new

  it "allows a plane to land at the airport" do
    expect(ap).to respond_to(:land)
  end

  it "prevents landing when airport is full" do
    expect{ap.is_full?}.to raise_error('Airport FULL')
  end

end
