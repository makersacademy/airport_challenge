require 'plane'

describe Plane do
  subject { Plane.new }

  it "allows a plane to land" do
    expect(subject).to respond_to(:land)
  end
end
