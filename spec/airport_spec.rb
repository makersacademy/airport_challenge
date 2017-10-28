require "airport.rb"
require "plane.rb"

describe Airport do

  # subject(:airport) { described_class.New }

  it "plane should be allowed to land" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.controller(plane)).to eq true
  end

end
