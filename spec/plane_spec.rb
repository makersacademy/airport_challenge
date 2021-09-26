require 'plane'

describe Plane do
  plane = Plane.new(1234)
  it "knows it's current airport" do
    expect(plane).to respond_to(:current_airport) # defaults to 0
  end

  it "can update the current airport" do
    plane.update_airport(555)

    expect(plane.current_airport).to eq(555)
  end
end
