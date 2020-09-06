require 'plane'

describe Planes do
  plane = Planes.new
  #it "responds to method flying" do
   # expect(plane).to respond_to :flying
  #end
  it "@in_flight true by default" do
    expect(plane.in_flight).to eq true
  end
end
