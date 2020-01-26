require 'plane'

describe Plane do
  it "sets plane to landed state" do
    plane = Plane.new
    plane.set_landed
	  expect(plane.landed?).to eq true
  end
end
