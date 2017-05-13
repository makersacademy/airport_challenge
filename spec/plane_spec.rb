require 'plane'

RSpec.describe Plane do
  subject(:plane) { Plane.new }
  let(:airport) { double :airport }

  it "makes a plane land" do
    expect(plane).to respond_to :land
  end

  it "makes a plane land at an airport" do
    expect(plane).to respond_to(:land).with(1).argument
  end

end
