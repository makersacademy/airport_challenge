require 'plane'

describe Plane do
  it "responds to call to #land from Air Traffic Controller" do
    expect(subject).to respond_to(:land)
  end
end
