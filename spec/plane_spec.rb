require 'plane'

describe Plane do
  let(:plane) {
    Plane.new
  }
  
  it "can land" do
    expect(plane).to respond_to(:landed)
  end
  
  it "knows it landed" do
    expect(plane.landed).to be true
  end
end
