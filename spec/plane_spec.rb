require 'plane'

plane = Plane.new

describe Plane do

  it "is initialized with @landed being false" do
    expect(plane.landed).to eq false
  end

  it "records when it has landed, to prevent double landing" do
    plane.plane_has_landed
    expect(plane.landed).to eq true
  end

  it "records when it is flying, to prevent double landing" do
    plane.plane_is_flying
    expect(plane.landed).to eq false
  end

end
