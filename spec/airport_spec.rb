require 'airport'

airport = Airport.new

describe Airport do
  it "lands a plane" do
    expect(airport).to respond_to(:land)
  end
end
