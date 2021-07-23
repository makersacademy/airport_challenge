require 'airport'
require 'plane'

describe Airport do
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}
  it "Should instruct the plane to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end
end