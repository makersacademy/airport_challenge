require_relative "../lib/plane.rb"

describe Plane do
  it "Airport responded to #tester" do
    expect(subject).to respond_to(:tester)
  end
end