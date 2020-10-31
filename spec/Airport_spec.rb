require "airport"

describe Airport do
  subject(:airport) { described_class.new }

  it "instructs a plane to land at an airport" do
    expect(airport).to respond_to(:land)
  end

  it "instructs a plane to take off from an airport" do
    expect(airport).to respond_to(:take_off)
  end
end
