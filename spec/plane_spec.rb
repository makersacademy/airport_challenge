require 'plane'

describe Plane do
  it "plane responds to #land" do
    expect(subject).to respond_to(:land)
  end
end
