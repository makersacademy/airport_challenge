require "plane"
describe Plane do
  it "checks if it responds to #stormy?" do
    expect(subject).to respond_to(:stormy?)
  end
end
