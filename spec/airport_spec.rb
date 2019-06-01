require "airport"

RSpec.describe Airport do
  it "is created with no planes" do
    airport = Airport.new

    expect(airport.landed_planes).to be_empty
  end
end
