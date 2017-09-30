require 'plane'

describe Plane do
  it "responds to method land" do
    expect(subject).to respond_to(:land)
  end
end
