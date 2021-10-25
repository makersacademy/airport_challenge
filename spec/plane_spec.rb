require_relative "../lib/plane"

describe Plane do
  it {should respond_to (:in_air)}
  it "should be able to be in the air" do
    plane = Plane.new(true)
    expect(plane.in_air).to eq true
  end
end