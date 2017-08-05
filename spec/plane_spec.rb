require_relative '../lib/plane'

describe Plane do

  it "Plane takes off" do
    plane = Plane.new
    expect(plane).to respond_to(:take_off)
  end
  
end
