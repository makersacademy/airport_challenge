require './lib/plane'

describe Plane do
  it "check responds to #land" do
    expect(Plane.new).to respond_to(:land)
  end
end
