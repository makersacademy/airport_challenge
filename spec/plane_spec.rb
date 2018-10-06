require 'plane'

describe "Plane" do
  it "plane is working?" do
  plane = Plane.new
  expect(plane.working?).to eq true
end
end
