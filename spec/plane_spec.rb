require "./lib/plane.rb"

describe Plane do
  it "is working" do
  plane = Plane.new
  expect(plane.working?).to eq("Plane is working")
  end

end