require "plane.rb"

describe Plane do
  it "responds to landed method" do
    expect(subject).to respond_to :landed
  end
end
