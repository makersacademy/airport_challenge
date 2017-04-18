require "plane"
require 'rspec/expectations'

describe Plane do

  it "instance variable 'landed' can be passed true/false as a value" do
    plane = Plane.new
    plane.landed = true
    expect(plane.landed).to eq true
  end
end
