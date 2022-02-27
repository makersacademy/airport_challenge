require 'plane'
require 'airport'

describe Plane do
  it "should return that new planes are flying already" do
    plane = Plane.new
    expect(plane.whereabouts).to eq :flying
  end
end
