# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
require "plane"

describe Plane do
  it { is_expected.to respond_to(:land) }

  it "can land" do
    expect(subject.land).to eq "We are landing"
  end

end
