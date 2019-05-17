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

  it "knows it took off" do 
    expect(plane.take_off).to be false
  end
end
