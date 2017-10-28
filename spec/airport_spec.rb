require "airport.rb"
require "plane.rb"

describe Airport do

  subject(:airport) { described_class.new }

  it "plane should be allowed to land" do
    plane = Plane.new
    expect(airport.land(plane)).to eq true
  end

  it "plane should be able to take off" do
    plane = Plane.new
    expect(airport.take_off(plane)).to eq true
  end

end
