require 'plane'

describe Plane do
  let(:plane) {
    Plane.new
  }
  
  it "can land" do
    expect(plane).to respond_to(:land)
  end
  
  it "can land" do
    expect(plane.land).to be true
  end
end
