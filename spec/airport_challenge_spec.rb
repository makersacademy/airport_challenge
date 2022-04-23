require "Airport"

describe Airport do
  
  it "instructs a plane to '#land' at an airport" do
    airport = Airport.new
    expect(airport).to respond_to(:land)
  end

end