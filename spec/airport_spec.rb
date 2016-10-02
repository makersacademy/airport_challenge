require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  it "responds to lands" do
    expect(airport).to respond_to(:land).with(1).argument
  end
  it "lands plane in airport" do
    planes = []
    planes << Plane.new
    expect(airport.land(plane)).to include(plane)
  end
  # it "confirms landing" do
  #   expect(confirm_landing).to include"The plane has landed"
  # end
end
