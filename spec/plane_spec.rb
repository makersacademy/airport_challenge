require "plane"

describe Plane do
  it "Instruct plane to land at airport" do
    expect(subject).to respond_to(:land_at_airport).with(1).argument
  end
end
