require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  it "lands at an airport" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "take off from an airport and confirm that it is no longer in the airport" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
end
