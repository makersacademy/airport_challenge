require "plane.rb"

describe Plane do
    it "is expected to return true to the plane is in_the_sky" do
    expect(Plane.new.in_the_sky?).to eq(true)
  end

end
