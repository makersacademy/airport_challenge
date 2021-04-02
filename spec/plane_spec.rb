require "plane"

describe Plane do
  it "Tests if plane can land" do
    expect(subject).to respond_to :land
  end
end