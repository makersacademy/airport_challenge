require 'plane'

describe Plane do
  it "instructs a plane to land at an airport" do
    expect(subject).to respond_to(:land).with(1).arguments
  end
end
