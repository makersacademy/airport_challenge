# expected to respond to depart
# exected to respond to land
require "plane"

describe Plane do
  it "will respond to methods :deapart and :land" do
    expect(subject).to respond_to(:depart)
  end
end
