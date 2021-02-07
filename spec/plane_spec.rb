require './lib/plane.rb'

describe Plane do
  it "can be told to land at a given airport" do
    plane = Plane.new
    expect(plane).to respond_to(:land).with(1).argument
  end
end
