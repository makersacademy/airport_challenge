require "plane"

describe Plane do

  it "makes the plane set to flying" do
    plane = Plane.new
    plane.start_flying
    expect(plane.flying?).to eq(true)
  end
end