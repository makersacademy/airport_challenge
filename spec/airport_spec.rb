require 'airport'
require 'plane'

describe Airport do

  it "instructs a plane to land at an airport" do
    expect(subject).to respond_to(:land)
  end

  it "instructs plane to take off from an airport" do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

end
