require "plane.rb"

describe Plane do
  it "creates an instance of Plane object" do
    expect(Plane.new).to be_an_instance_of(Plane)
  end
end