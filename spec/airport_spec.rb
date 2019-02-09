require 'airport.rb'

describe Airport do
  it "responds to #takeoff" do
    airport = Airport.new
    expect(airport).to respond_to(:takeoff)
  end
end
