require "./lib/plane.rb"

describe Plane do

  it "creates the new plane class" do
    plane = Plane.new
    expect(plane).is_a?(Plane)
  end

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  it "is no longer in the airport after take off" do
    plane = Plane.new
    plane.take_off
    expect(plane.location).to eq("In the air")
  end
end
