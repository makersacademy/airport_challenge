require 'plane'

describe Plane do
  it "is landed by default" do
    expect(Plane.new).not_to be_flying
  end

  it "can fly" do
    plane = Plane.new

    plane.fly

    expect(plane).to be_flying
  end

  it "can land" do
    plane = Plane.new

    plane.fly
    plane.land

    expect(plane).not_to be_flying
  end
end
