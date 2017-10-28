require "airport.rb"
require "plane.rb"

describe Airport do

  subject(:airport) { described_class.new }

  it "plane should be allowed to land" do
    plane = Plane.new
    expect(airport.controller(plane)).to eq true
  end

end
