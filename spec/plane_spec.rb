require "plane"

describe Plane do
  it {is_expected.to respond_to :land }
  it "Lands at an airport" do
    plane = subject.land
    expect(plane).to eq true
   end
  end
