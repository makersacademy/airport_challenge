require './lib/plane'

describe Plane do
  it "check responds to #land(airport)" do
    expect(Plane.new).to respond_to(:land).with(1).argument
  end
end
