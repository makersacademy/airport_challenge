require 'airport'

describe Airport do

  it "has a method to instruct a plane to land at the airport" do
    expect(Airport.new).to respond_to(:land)
  end

end
