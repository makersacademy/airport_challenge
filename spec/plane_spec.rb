require 'plane'

describe Plane do
  it "report left airport" do
    plane = Plane.new
    expect(plane.left_airport?).to eq(true)
  end

end
